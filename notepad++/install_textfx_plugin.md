# Install TextFX plugin to notepad++


Go onto SourceForge and tracked down the latest TextFX file to import manually:

	https://sourceforge.net/projects/npp-plugins/files/TextFX/TextFX%20v0.26/

It's from

	2009-08-02

So, how much longer will it work?

I download and unzip

	C:\Users\USERNAME\Downloads\TextFX.v0.26.unicode.bin


Stop notepad++, and **Run Notepad++ as admin**


within NotePad++ choose "Settings" | "Import" | "Import plugin(s)..." and import the .DLL from that location.

Immediately I see a "TextFX" menu item.

I then exit Notepad++ so I'm no longer running as administrator.

When I restart Notepad++ as non admin I still have the "TextFX" menu, so the plugin has worked.


## Things that don't work....

Use the technique above, as the following leads nowhere:

Trying to install TextFX through the plugin manager (Plugins | PLugin Manager | Find available... select TextFX, press Install)

A dialog appears showing download progress from a url starting with: "http://downloads.sourceforge.net/project/npp-plugins/TextFX/TextFX%20v"

But then it errors with:

	---------------------------
	Installation Error
	---------------------------
	Installation of TextFX Characters failed.
	---------------------------
	OK
	---------------------------

On the "Plugin Manager" dialog when I press "Settings" I see this message:


	Plugin Config path is:
	C:\Users\USERNAME\AppData\Roaming\Notepad++\plugins\Config
	Plugins in user's AppData directory are disabled - to enable in Notepad++ version 5.9.7 onwards place an empty file called allowAppDataPlugins.xml in the Notepad++ directory.


Anyway, to get around the error above, I used the technique above instead.



## See also

 * [Need a shortcut that inserts the current date/time?](todays_date.md)
 * [Resolved: There was an error downloading the plugin list](error_downloading_the_plugin_list.md)