# Use mstsc.exe to connect, receive Black screen 

After logging into a remote computer with remote desktop (rdp via mstsc.exe) the screen goes black.

The trick is to press `Ctrl + Alt + End`

..which:

> Brings up the Windows Security dialog box for the Remote Desktop Session Host (RD Session Host) (provides the same functionality as pressing CTRL+ALT+DEL on the local computer).

This forces the entire screen to redraw, and thus invalidates the bitmap cache.

The alternative is to change your remote desktop connection options (under "Experience" tab) :  Uncheck "Persistent bitmap caching"

## Source

 * [why is my screen black after rdp connection?](http://superuser.com/questions/306412/why-is-my-screen-black-after-rdp-connection)
 * [Remote Desktop Services Shortcut Keys](https://msdn.microsoft.com/en-us/library/aa383500.aspx)
 