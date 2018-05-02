# Module and Package Commands

(A module is one type of "package" &mdash; a package which exports a bunch of cmdlets.)

1. `Get-PackageProvider`    
    Lists all package providers. Currently: Chocolatey, msi, msu, NuGet, PowerShellGet, Programs
2. `Install-PackageProvider -Name Chocolatey`    
    Installs the named package provider.
3. `Find-Package`    
    Use `PackageManagement` to search all package providers for a package.
4. `Find-Module`    
    Use the `PowershellGet` package provider to search for a module (includes looking at the [PsGallery](https://www.powershellgallery.com/). 
5. `Find-Script`    
    Use the `PowershellGet` package provider to search for a script (includes looking at the [PsGallery](https://www.powershellgallery.com/). 
6. `Install-Module`    
    Installs a module but does not load it. **Requires elevation.**
7. `Import-Module`      
    Loads a module that is already installed or available on your machine.
8. `get-module -listAvailable`    
    lists installed (i.e. available) modules. They **may not** have been imported (i.e. loaded)
9. `get-module`    
    lists installed (i.e. available) and imported (i.e. loaded) modules.
 
TODO: How to add a path such that it shows up in $env:PSModulePath 
 
## See Also

 * [Use Get-Module to list all available modules (packages)](Get_All_Available_Modules.md)
 * [How To Completely Remove a Module](how_to_completely_remove_a_module.md)
 * [How to remove a package provider](remove_package_provider.md)
 * [PsGet Conflicts with PowershellGet](psget_conflicts_with_PowerShellGet.md)
 * [npm tab completion with powershell (module example)](../npm/tab_completion_with_powershell.html)
 