# Bind JSON POST to MVC Action

You already put a `[method: HttpPost]` attribute on the action.

But when you look at the received parameter, it is null.

Hint: try the `[FromBody]` attribute on the parameters.

And ensure the POST is given a `Content-type` of `application/json`

	x.setRequestHeader('Content-type', 'application/json')

## Sources

 * [Andrew Lock: Model binding JSON POSTs in ASP.NET Core](https://andrewlock.net/model-binding-json-posts-in-asp-net-core/)
 * [.Net Core Model Binding JSON Post To Web API](https://stackoverflow.com/questions/45086480/net-core-model-binding-json-post-to-web-api)