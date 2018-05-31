# Plugins for Notepad++

(Not extensions, not addins, not add-ons, not apps, not packages... Plugins!)

Plugin Config path is: 

	$env:APPDATA\Notepad++\plugins\Config

In main menu, go to "Plugins" -> "Plugin manager"


Note: 

There's also "Settings" -> "Import" -> "Import Plugins"

You can use that facility with a NotePad++ plugin DLL that you've downloaded separately.

## What If I don't have "Plugin Manager?"

It's no longer included with Notepad++ because it includes sponsored ads that some people didn't like. 

See <https://notepad-plus-plus.org/community/topic/14496/no-plugin-manager/3>

download it here:

<https://github.com/bruderstein/nppPluginManager/releases>

Unzip it and copy the extracted files to your notepad++ plugins and updater folder. (which, as described about is:

	$env:APPDATA\Notepad++\plugins\Config



## Updating plugins...

These plugins need to be updated, apparently.

 * DSpellCheck
 * NppFTP

And when I try to update them I get this message...

    ---------------------------
    Plugin Manager
    ---------------------------
    An update is available to Plugin Manager.  It is *strongly* advised that the Plugin Manager is updated before any other plugin is installed or updated.  Would you like to update the Plugin Manager now?
    ---------------------------
    Yes   No   Cancel   
    ---------------------------


I choose "Yes", I get a UAC dialog, NotePad++ restarts and then the updates have still not been installed.

I try running Notepad++ as admin... but the exact same result occurs.

So instead, when confronted with that dialog, I chose "No" -- and then the plugins that need updating are indeed updating succesfully.

## See Also

 * <https://pulpphikshun.wordpress.com/2014/03/18/how-i-hacked-your-router/comment-page-1/>
 