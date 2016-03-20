# Making a custom error page helpful for developers

Sometimes (for apps on an intranet), on the custom error page I put something like this:


    @model System.Web.Mvc.HandleErrorInfo

    @if (Model != null)
    {
        <p>@Model.Exception.GetType().Name<br />
        thrown in @Model.ControllerName @Model.ActionName</p>
        <p>Error Details:</p>
        <p>@Model.Exception.Message</p>
    }


Since you're leaking details to the outside world I don't recommend it for all sites. Can also make sure it's only shown to some users.


    <customErrors defaultRedirect="~/Error/HttpError" mode="On">
      <error statusCode="404" redirect="~/Error/NotFound"/>
    </customErrors>


I use Elmah.axd to log errors. See [elmah](/elmah.md) &mdash; make sure it's secure!

