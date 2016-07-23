# ConsoleZ as a replacement over Console2.

    choco install consoleZ
    
(after first running as admin)    

Here's where I run console (Console2) from:

    $env:util\Console.exe

Here's where choco installed ConsoleZ

    C:\ProgramData\chocolatey\lib\ConsoleZ\tools\console.exe


To run consoleZ as admin: 

    Start-Process "$env:ChocolateyInstall\lib\ConsoleZ\tools\console.exe" -Verb runAs
   
   
(Assuming `$env:ChocolateyInstall` is correct)