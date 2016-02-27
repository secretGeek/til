# Non-default settings for ConsoleZ (or Console2)

Stored in console.xml

    $env:appdata\console\console.xml
    %appdata%\console\console.xml


Settings dialog is under the edit menu. (Or hit Ctrl S) (As opposed to Tools -> Options) 

Okay I'm just going to record all of the non-standard settings I use.

In theory I could use [cogs](https://bitbucket.org/rhysparry/cogs) to manage all my settings for all my apps, but currently I don't.


* Appearance -> Styles
  * Controls -> Windowed
    * Uncheck: 
      * Show menu
      * Show toolbar
      * Show search
      * Show statu bar
    * Check
      * Tabs on bottom
* Appearance -> Font
  * Name: Consolas  Size:15
* Appearance -> Transparency
  * Alpha
    * Active:   40/250
    * Inactive: 80/250
* Behavior
  * Check: Copy on select
* Hotkeys ->
  * Paste -> Ctrl+V
* Hotkeys -> Mouse
  * Copy/Clear Selection    ->  None
  * Select text           ->  Left
* Tabs
  * PowerShell
    * Title   PowerShell
    * Icon    C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
    * Shell   C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned
  * Git Bash
    * Title       Git Bash
    * Icon        C:\Program Files\Git\etc\git.ico
    * Shell       C:\WINDOWS\system32\cmd.exe /c ""C:\Program Files\Git\bin\sh.exe" --login -i"
    * Startup dir %HOMEDRIVE%%HOMEPATH%
  * VS Shell
    * Title       VS Shell
    * Shell       cmd %comspec% /k ""C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\Tools\VsDevCmd.bat""
    * Startup dir "C:\Program Files (x86)\Microsoft Visual Studio 11.0\"