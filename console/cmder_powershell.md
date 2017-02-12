# cmder powershell settings

Under settings | Startup | Tasks

Move {Powershell::Powershell} to the top of the list.

Click "Default task for new console"

The commands for {Powershell::Powershell} start as:

    PowerShell -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%ConEmuDir%\..\profile.ps1'''" -new_console:d:"%USERPROFILE%"

Change this to:


    PowerShell -ExecutionPolicy Bypass -NoLogo -NoExit -new_console:d:"C:\wip\Scratch\nimble"

