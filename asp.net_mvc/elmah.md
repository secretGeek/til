# Elmah - error handling

Add nuget packages, elmah and elmah.mvc

Now you have to make it secure. Otherwise google will index your logs, and hackers will forever find your secrets.


One technique is:

    <elmah>
        <security allowRemoteAccess="0" />


But if you need to see the logs remotely, you have to set that to "1" &mdash; and then limit the access via standard location settings.

e.g. Here I'm only allowing access to a user called leon. It's also important to make sure the handlers are under the secured location.


    <location path="elmah.axd">
        <system.web>
          <httpHandlers>
            <add verb="POST,GET,HEAD" path="elmah.axd" type="Elmah.ErrorLogPageFactory, Elmah"/>
          </httpHandlers>
          <authorization>
            <allow users="leon"/>
            <deny users="*"/>
          </authorization>
        </system.web>
        <system.webServer>
          <handlers>
            <add name="Elmah" path="elmah.axd" verb="POST,GET,HEAD" type="Elmah.ErrorLogPageFactory, Elmah" preCondition="integratedMode"/>
          </handlers>
        </system.webServer>
      </location>



Also, in `RegisterRoutes`

    routes.IgnoreRoute("admin/elmah.axd/{*pathInfo}");


## See also

 * https://code.google.com/p/elmah/wiki/SecuringErrorLogPages
 * http://haacked.com/archive/2007/07/24/securely-implement-elmah-for-plug-and-play-error-logging.aspx/
 * https://www.stormconsultancy.co.uk/blog/development/tools-plugins/allowing-secure-remote-access-to-your-elmah-error-log/
 * http://www.troyhunt.com/2012/01/aspnet-session-hijacking-with-google.html
 * http://stackoverflow.com/questions/1245364/securing-elmah-in-asp-net-website