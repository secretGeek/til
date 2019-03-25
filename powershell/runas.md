## For a new process to runas a different (admin) user from powershell



    #run a new console window as admin, like so:
    Start-Process console.exe -Verb runAs
    #Or you might prefer
    Start-Process powershell -Verb runAs

Or better yet..
    
    Start-Process "$env:ChocolateyInstall\lib\ConsoleZ\tools\console.exe" -Verb runAs
    
    Start-Process C:\Users\Leon\Downloads\cmder_mini\vendor\conemu-maximus5\ConEmu64.exe -Verb runAs
	
Or simply:	
	
	Start-Process ConEmu64.exe -Verb runAs
	
	
![run... run as administrator](Run_Runas_Administrator.jpg)