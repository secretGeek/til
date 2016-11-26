# Cmder 

Cmder relies on Conemu to create a beautiful console experience on windows. 

What matters the most: How do you insert?

Paste with Shift Insert -- which on a macbook air is "fn shift enter"


## Using Powershell with Cmder...

Set cmder to load powershell by default, via:

Settings -> Startup -> Tasks

Find the {Powershell::Powershell} task and move it Up Up Up to the top.

Change the task parameters:

PowerShell -ExecutionPolicy Bypass -NoLogo -NoExit -new_console:d:"C:\users\leon\dropbox\secretgeek"

...instead of the default task parameters which swap in a different profile.ps1 file, etc.

Then, in:

Settings -> Startup

Put the startup options as

"Specified Named task" --> {Powershell::Powershell}


## Color schemes

Their favorite color scheme is the muted tones of the "Monokai" color scheme.

If you want a fully light colored scheme -- keeps people awake in talks -- try "Tomorrow"



## Arrow keys when running bash.exe (windows subsystem for linux)

This is a known issue lodged with ConEmu...

    https://github.com/Maximus5/ConEmu/issues/811

And traced back to a fault in the design of bash.exe

    https://github.com/Microsoft/BashOnWindows/issues/111



## Source

 * <http://superuser.com/questions/652155/configure-powershell-to-be-conemus-default-shell>