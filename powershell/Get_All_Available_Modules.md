# Use Get-Module to list all available modules (packages)

You might think that

    get-module

...lists all of the available modules. But it only lists the ones that are loaded.
    
This command lists all that are installed (i.e. available)    
    
    get-module -ListAvailable

    
To search outside your machine, use Find-Module. 


## See also

 * More about [package/module commands](../powershell/module_commands.md)
