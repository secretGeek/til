# Config from an external source

Say you want your connectionStrings to be pulled in from an external file, you can do that like this:


	<connectionStrings configSource="ConnectionStringsProduction.xml" /> 
	
That way, for example, your `web.config`, your `application.config` (for some other apps) and your `linqpad.config` can all use the exact same file for connectionStrings (even though the rest of their config is very unique.

Or if you have 3 different web applications that all want the same config for just part of their config file, you can use this trick.