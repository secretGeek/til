##for a new process to runas a different (admin) user from powershell



    #run a new console window as admin, like so:
    Start-Process console.exe -Verb runAs
    #Or you might prefer
    Start-Process powershell -Verb runAs
