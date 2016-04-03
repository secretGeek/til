# Install chocolatey (aka choco)

From `cmd.exe` (with administrative rights)

    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

    
Or, from powershell (with administrative rights):    

    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
    
    
After that, [choco commands](commands.md) should work.

## See Also

To quickly launch cmd.exe or powershell with admin rights use [runas](../powershell/runas.md) &mdash; (kv runas)


## Links

https://chocolatey.org/
