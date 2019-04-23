# Troller &mdash; the trollful way of working with asp.net MVC

This is an approach called variously 'troller', 'beCool' or WTFLeon?. A more accurate name would be "AjaxAwareController".

It's been a while since I used this approach, but I want to document it for posterity and so that I can do something similarly awful to other frameworks in the future.

I was working with asp.net MVC a fair bit, back in 2013 and sometimes I wanted to return JSON from methods, sometimes (often) I wanted that JSON to contain rendered html, because javascript templating was not up to scratch (then and now).

Hence I created a class, `Troller`, that derived from `Controller` (and you must know how loathe i am to inherit... the only thing worse than inheritance hierarchies are database transactions: ideas that are universally overused)


    namespace System.Web.Mvc
    {
        using System;

        public class Troller : Controller
        {
            public ActionResult Partial(bool successValue, Object model)
            {
                if (this.Request.IsAjaxRequest())
                {
                    return this.Json(new { success = successValue, html = this.RenderPartialViewToString(model) });
                }
                else
                {
                    return PartialView(model);
                }
            }

            public ActionResult Partial(bool successValue, string viewName, Object model, JsonRequestBehavior jrq)
            {
                if (this.Request.IsAjaxRequest())
                {
                    return this.Json(new { success = successValue, html = this.RenderPartialViewToString(viewName, model) }, jrq);
                }
                else
                {
                    return PartialView(viewName, model);
                }
            }

            public ActionResult Partial(bool successValue, Object model, JsonRequestBehavior jrq)
            {
                if (this.Request.IsAjaxRequest())
                {
                    return this.Json(new { success = successValue, html = this.RenderPartialViewToString(model) }, jrq);
                }
                else
                {
                    return PartialView(model);
                }
            }

            public ActionResult Redirect(bool successValue, string redirectUrl)
            {
                if (this.Request.IsAjaxRequest())
                {
                    return this.Json(new { success = successValue, redirectTo = redirectUrl });
                }
                else
                {
                    return Redirect(redirectUrl);
                }
            }
        }
    }

All of that relies heavily on the ability to `renderPartialViewToString` &mdash; which comes from these extension methods (3 overloads and an **actual** &mdash; still wish there was an attribute for "actual!" ) :

    namespace System.Web.Mvc
    {
        using System.IO;

        public static class ControllerExtensions
        {

            public static string RenderPartialViewToString(this Controller controller)
            {
                return controller.RenderPartialViewToString((string)null, null);
            }

            public static string RenderPartialViewToString(this Controller controller, object model)
            {
                return controller.RenderPartialViewToString(null, model);
            }

            public static string RenderPartialViewToString(this Controller controller, string viewName)
            {
                return controller.RenderPartialViewToString(viewName, null);
            }

            public static string RenderPartialViewToString(this Controller controller, string viewName, object model)
            {
                if (string.IsNullOrEmpty(viewName))
                    viewName = controller.ControllerContext.RouteData.GetRequiredString("action");

                controller.ViewData.Model = model;

                using (var sw = new StringWriter())
                {
                    var viewResult = ViewEngines.Engines.FindPartialView(controller.ControllerContext, viewName);
                    var viewContext = new ViewContext(controller.ControllerContext, viewResult.View, controller.ViewData, controller.TempData, sw);
                    viewResult.View.Render(viewContext, sw);

                    return sw.GetStringBuilder().ToString();
                }
            }
        }
    }


Then, each `Controller` would inherit from `Troller` (instead of inheriting from Controller) &mdash; and would be able to, for example:

        return this.Partial(true, model);

(note my loathing of inheritance... i was willing to accept the user deleting 'con' from the start of an inheritance hierarchy they were already forced to accept, but not willing to accept them inheriting from `AjaxAwareController` or anything like that...)

Thereafter, if the route had been requested by a normal click: no problems, it all happened the same, but if it had been requested via AJAX, the result would be wrapped in JSON containing `.success = true` (or false) and the accompanying html in a `.html` property. And it therefore relied on the client-side javascript expecting such a result.

Here's the javascript describing *ALL* form submissions... And it depends on the following assumptions:

 1. The form submission should be performed over ajax, not via a regular form submission
 2. The target of the form submit comes from `form[0].action`
 2. Any item within the form being submitted that has a class of `progress` should be given a class of `waiting`.
 3. The nearest parent of the form, classed either `modal` or `span10` should be replaced with the result of this submission.
 4. A complete description of the form being submitted can be obtained from the `ToJson(form)` method (described below)
 5. Whatever result comes back, it should have the same rules applied to it, as the entire document did upon ready (via a function called `beCool`)


    here.find('form').submit(function (e) {
        var form, url, action;
        form = $(this);
        url = form[0].action;
        data = toJson(form);
        element = form.closest(".modal,.span10");
        form.find('.progress').addClass('waiting');

        postElement(url, data, element, function (result) {
            if (result.redirectTo) {
                window.location = result.redirectTo;
            }
            if (result.html) {
                element.html(result.html);
                beCool(element);
            } else {
                if (result.success == false) {
                    notCool(result.message);
                }
                //what if no result.html and: result.success = true, or no result.success?
            }
        });
        e.preventDefault();
        return false;
    });


The `postElement` method, alluded to above, is as follows:


    function postElement(url, data, element, successAction) {
        if (successAction == undefined) {
            successAction = function (result) {
                var html = result.html || result;
                $(element).html(html);
                beCool(element);
            };
        }

        data = JSON.stringify(data);

        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            cache: false,
            contentType: "application/json; charset=utf-8",
            success: successAction,
            beforeSend: function () {
                $(element).addClass('waiting');
            },
            complete: function () {
                $(element).removeClass('waiting');
            },
            error: handleError
        });
    }

And the `toJson` which is kind of asp.net MVC specific, as described in the comments:

    function toJson(form) {
        // find inputs
        var inputs = $(form).find(':input');
        var values = {};
        inputs.each(function () {
            if (!this.name) return; //unnamed inputs are typically submit buttons

            // for radio buttons and checkboxen return their jquery checked state
            if (this.type == "radio" || this.type == "checkbox") {
                values[this.name] = $(this).is(':checked');
            } else {
                //for all other inputs (buttons, textboxes, select and textareas, return their value
                if (values[this.name] == undefined) {
                    values[this.name] = $(this).val();
                } else {
                    // In mvc, checkboxes render an extraneous hidden field, containing 'false', that should be ignored.
                    // so, if we've already gathered a value for this control (and it was true or false) then don't read this one in
                    if (!this.type == "hidden" || (!values[this.name] == true && !values[this.name] == false)) {
                        values[this.name] = $(this).val();
                    }
                }
            }
        });

        return values;
    }


One other thing I haven't mentioned, the accompanying CSS, implied by the assumptions above:

    .progress.waiting
    {
        background-image: url(/content/images/spinner.gif);
        background-repeat: no-repeat;
    }


And here's some other CSS I've dug up which I applied to the `progress` class.

    .modal-footer .progress
    {
        float: right;
    }

    .progress
    {
        margin-top: 7px;
        display: inline-block;
        width: 16px;
        height: 16px;
    }

The document.ready is just a call to beCool, like this:

    $(document).ready(function () {
        beCool();
    });

Where 'beCool' starts like this and defines everything else about any element that is ready.

    function beCool(here) {
        here = $(here || document);
        ...
    }

If you previously would've written code like this to apply a particular behavior to a selector across the document:


    $(document).ready(function () {
        $('.bunnies').click(function (e) {
          alert('Hopping!');
        });
    });

...this would have the downside that when new parts of the document are loaded in later, they won't have that behavior.

Instead write code like this:


    $(document).ready(function () {
        beCool();
    });

    function beCool(here) {
        here = $(here || document);
        here.find('.bunnies').click(function (e) {
          alert('Hopping!');
        });
    }

The page will get the same behavior on load, and when new parts of the page are loaded, call "beCool($('#newPart'));" on the newly loaded part (assuming the newly loaded part has an id of 'newPart') and:

1. All of the page's behavior will then be applied to the newPart. And:
2. Behavior will not be *reapplied* to any other part of the page.

