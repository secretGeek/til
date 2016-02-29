# How to completely remove a module

If you have a conflict with a module then you may need to remove it from your machine.

The remove-module commandlet DOES NOT remove the module from your machine, it only:

    Removes modules from the current session.

In other words it reverses:

    Import-Module  -- which adds modules to the current session.
    
It does not reverse:

    Install-Module  -- (with which a "package provider" downloads and installs a module from a "package source")
    
You need to find where the module sits (each module is a directly full of files) and delete that folder. (Or move it out of harm's way)

    get-module -listavailable
    
Shows you where each of the modules are located, 

e.g.

    Directory: C:\Users\Agatha\Documents\WindowsPowerShell\Modules
    Directory: C:\Program Files\WindowsPowerShell\Modules
    Directory: C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
    Directory: C:\Program Files (x86)\Code Owls LLC
    ...and others...

And the results you see from get-module will depend upon where you are running a 32-bit or 64-bit version of Powershell. And which user.

(A module is a "package" -- a specific type of package which exports a bunch of cmdlets.)


## See also

 * More about [package/module commands](../powershell/module_commands.md)
