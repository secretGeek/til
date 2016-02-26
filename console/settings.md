# Non-default settings for ConsoleZ (or Console2)

Stored in console.xml
    $env:appdata\console\console.xml
    %appdata%\console\console.xml


Under Edit -> Settings.
(As opposed to Tools -> Options) (Or hit Ctrl S)

Appearance -> Styles

    Controls -> Windowed
        Unclick: 
            [_] Show menu
            [_] Show toolbar
            [_] Show search
            [_] Show statu bar
        Click
            [x] Tabs on bottom

Appearance -> Font
        Name: Consolas  Size:15
        

Appearance -> Transparency
        Alpha
            Active:   40/250
            Inactive: 80/250

Behavior
        [x] Copy on select


Hotkeys ->
        Paste -> Ctrl+V
        
Hotkeys -> Mouse
    
        Copy/Clear Selection    ->  None
        Select text             ->  Left
        

Tabs
    PowerShell
        Title   PowerShell
        Icon    C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
        Shell   C:\WINDOWS\system32\windowspowershell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned
        
    Git Bash
        Title       Git Bash
        Icon        C:\Program Files\Git\etc\git.ico
        Shell       C:\WINDOWS\system32\cmd.exe /c ""C:\Program Files\Git\bin\sh.exe" --login -i"
        Startup dir %HOMEDRIVE%%HOMEPATH%

    VS Shell
        Title       VS Shell
        Shell       cmd %comspec% /k ""C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\Tools\VsDevCmd.bat""
        Startup dir "C:\Program Files (x86)\Microsoft Visual Studio 11.0\"