# Module and Package Commands

(A module is one type of "package" -- a package which exports a bunch of cmdlets.)

1. `Get-PackageProvider`
    Lists all package providers. Currently: Chocolatey, msi, msu, NuGet, PowerShellGet, Programs
2. `Install-PackageProvider -Name Chocolatey`
    Installs the named package provider.
3. `Find-Package`    
    Use PackageManagement to search all package providers for a package.
4. `Find-Module`
    Use PowershellGet to search for a module. 
5. `Install-Module`
    Installs a module but does not load it. **Requires elevation.**
6. `Import-Module`      
    Loads a module that is already installed or available on your machine.
7. `get-module -listavailable`
    lists installed (i.e. available) modules. They **may not** have been imported (i.e. loaded)
8. `get-module`
    lists installed (i.e. available) and imported (i.e. loaded) modules.
    
    