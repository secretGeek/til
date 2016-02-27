Sometimes on the error page (such as Shared\Error.cshtml) I put something like this:



@model System.Web.Mvc.HandleErrorInfo


@if (Model != null)
{
    <p>@Model.Exception.GetType().Name<br />
    thrown in @Model.ControllerName @Model.ActionName</p>
    <p>Error Details:</p>
    <p>@Model.Exception.Message</p>
}


I need to research this some more. Seems like you're leaking details to the outside world, so I don't recommend it straight up.



    <customErrors defaultRedirect="~/Error/HttpError" mode="On">
      <error statusCode="404" redirect="~/Error/NotFound"/>
    </customErrors>