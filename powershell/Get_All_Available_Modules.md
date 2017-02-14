# Use Get-Module to list all available modules (packages)

You might think that

    get-module

...lists all of the available modules. But it only lists the ones that are loaded.
    
This command lists all that are installed (i.e. available)    
    
    get-module -ListAvailable

    
To search outside your machine, use `Find-Module` (see [more package/module commands](module_commands.md)) 

To see the location of a module (for example, where is that emoji module....?)

    get-module -listavailable emoji* | % Path

To turn that string into a [FileInfo](parts_of_a_fileInfo_object.md) and get its directory...

    get-module -listavailable emoji* | % Path | Get-Item | % DirectoryName    
    
    
    
## See also

 * More about [package/module commands](module_commands.md)
 * [Get Parts of a FileInfo object](parts_of_a_fileInfo_object.md)