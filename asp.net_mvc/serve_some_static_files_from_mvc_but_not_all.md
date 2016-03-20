# Serving some images from MVC but not all

I want *some* `.png` requests to be served by asp.net MVC, and most of them to just be served as  static images.

I got it working with the IIS express, but it returned IIS level 404's when shipped to production (which uses real IIS).

In other words, the request never made it to the application. IIS looked at the url, assumed it referred to a static file, checked for the existence of the static file on disk, didn't find it, and thus quit.

If you want *ALL* static files to be served from MVC (rather than IIS) you add this to your `web.config`

    <modules runAllManagedModulesForAllRequests="true">

...under &lt;system.WebServer>

aka &mdash; [THE  DREADED RAMMFAR!!](http://www.hanselman.com/blog/BackToBasicsDynamicImageGenerationASPNETControllersRoutingIHttpHandlersAndRunAllManagedModulesForAllRequests.aspx)

But that means *every* request will be sent to Asp.net, which could create a whole bunch of work for you.

If you only want a subset &mdash; a folder for example &mdash; to be routed through Asp.net (and MVC), then you can use this approach:

Under this node:

    <system.webServer>
        <handlers>
    
Add, for example:    

    <add name="MyImageHandler" path="HelpImg/*" verb="GET" type="System.Web.Handlers.TransferRequestHandler" preCondition="integratedMode,runtimeVersionv4.0"/>

`name` is unimportant, just a name.
`verb` is `GET`, because we're only interested in getting the images.
`path` is important... it's the folder which we are allowing. For me it was `HelpImg/*`

The rest of the rule is the same as this existing rule, which you should find in that handlers section already:

    <add name="ExtensionlessUrlHandler-Integrated-4.0" path="*." verb="GET,HEAD,POST,DEBUG,PUT,DELETE,PATCH,OPTIONS" type="System.Web.Handlers.TransferRequestHandler" preCondition="integratedMode,runtimeVersionv4.0"/>

...and by the time you're reusing this technique, that other rule may have moved on a bit... so make it match with it.


Thanks to Darin Dimitrov's answers here.

 * http://stackoverflow.com/questions/14327476/prevent-static-file-handler-from-intercepting-filename-like-url
 * http://stackoverflow.com/questions/16997963/asp-net-mvc-4-filepathresult-and-staticfile-handlers

