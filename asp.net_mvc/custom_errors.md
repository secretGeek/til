# Custom Errors in asp.net mvc 5

(This is not for .net core)


1. Inside `system.web` element in the `web.config` file:

	&lt;customErrors defaultRedirect="~/Error" mode="On"&gt;
		&lt;error statusCode="404" redirect="~/Error/NotFound" /&gt;
		&lt;error statusCode="403" redirect="~/Error/Forbidden" /&gt;
		&lt;error statusCode="407" redirect="~/Error/Security" /&gt;
	&lt;/customErrors&gt;

2. In FilterConfig ensure you are *not* adding a `HandleErrorAttribute`

	public static void RegisterGlobalFilters(GlobalFilterCollection filters)
	{
		//filters.Add(new HandleErrorAttribute()); //Ensure this is commented out or deleted.
	}

3. Create an Error controller.

	public class ErrorController : Controller
	{
		public ActionResult Index()
		{
			Response.TrySkipIisCustomErrors = true;
			// This will load Views/Shared/Error.cshtml
			return View("Error");
		}

		public ActionResult NotFound()
		{
			Response.StatusCode = 404;
			Response.TrySkipIisCustomErrors = true;
			// This will load Views/Error/View.cshtml
			return View();
		}

		public ActionResult Forbidden()
		{
			Response.StatusCode = 403;
			Response.TrySkipIisCustomErrors = true;
			// This will load Views/Error/Forbidden.cshtml
			return View();
		}
	}



In an action where you look for a resource but can't find it... don't do this:

	return this.HttpNotFound();

...as that will end up at the IIS error page, not your custom error page.
instead do this:



	throw new System.Web.HttpException(404, "No such project");

..and it will end up on your "NotFound" page.


Inside those error handling views, I have things like this:


	@model System.Web.Mvc.HandleErrorInfo

	@{
		ViewBag.Title = "Error";
	}

	<img src="/images/Doh.jpg" alt="Homer Simpson giving a Doh reaction" title="Missing" style="float:right;margin:30px;" />
	<h1 class="error">404 - File not found.</h1>

	@if (Model != null)
	{
		<h2 class="error">@Model.Exception.Message</h2>

		if (Authorized.Admin() || Authorized.Editor())
		{

			<p>
				Exception of type: <code><strong>@Model.Exception.GetType().Name</strong></code><br />
				Thrown in <code>Controller: <strong>@Model.ControllerName</strong>, Action: <strong>@Model.ActionName</strong></code>
			</p>

			<h2>Details:</h2>


			<p>@Html.Raw(Model.Exception.ToString().Replace("\r\n", "<br />\r\n"))</p>
		}
	}
	else
	{
		<h2 class="error">Look not here. We cannot find that which you seek.</h2>
	}

