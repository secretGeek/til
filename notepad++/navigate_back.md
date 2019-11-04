# How to navigate back in Notepad++

In visual studio I use `Ctrl Minus` to move back to my previous location. And in Powershell I use `popd`.

I wish there was an equivalent in Notepad++.

...and stackoverflow says:

> [Location Navigate (LocationNav)](http://sourceforge.net/projects/locationnav/) has hotkeys for moving backwards/forwards across both cursor positions and across source edits.
> &mdash;[Arithmomaniac](http://stackoverflow.com/a/17410670)

Installing that plugin.

Don't do this: Download the zip from http://sourceforge.net/projects/locationnav/ and unzip it to reveal a dll.

Go to "Plugins" -> "Plugin Manager" -> "Show Plugin Manager" -> Available -> Location Navigate -> Install

It tells me I need to install updates to the plugin manager, but doing that only seemed to stop the plugin I want from updating.

Once installed I had to turn off the "Mark changed line" option (Under "Plugins" -> "Location Navigate" 

And make sure "Auto Record" is on. 

And then voil&aacute;!


## See also

* [VS Code: Navigate back](..\vs_code\navigate_back.md)
