# How to remove a package provider

Somehow I ended up with two conflicting nuget package providers.
I had to remove them both before it would use the correct one.

        nuget                    2.8.5.202
        NuGet                    2.8.5.127        Destination, SkipDependencies, Con
        
        
To remove a package provider:

Find the path of the provider, for example:

(Get-packageProvider -name nuget).ProviderPath

Gave this file name:

    $env:localappdata\PackageManagement\ProviderAssembles\nuget-anycpu.exe
    
So -- close Powershell (so that the file is not locked).

Then **delete** that exe (or move it somewhere else if you're more comfortable with that)

Once I'd removed the first one, this command

    (Get-packageProvider -name nuget).ProviderPath

now returned:

    C:\Program Files (x86)\PackageManagement\ProviderAssemblies\nuget\2.8.5.202\Microsoft.PackageManagement.NuGetProvider.dll

There are several places where PackageProviders can live, see https://github.com/OneGet/oneget/wiki/Provider-assembly-search-locations

Either nuget package provider switched from one location to another some time between 2.8.5.127 and 2.8.5.202 or the commands I used when attempting to installed the provider forced the use of specific location.

These are the two different commands I used for installing it

    Install-PackageProvider -Name NuGet -Force    
    (installed 2.8.5.127)

    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force    
    (installed 2.8.5.201)

I may have used a -ForceBootstrap parameter in there too, just for fun.



## Source:

 * http://stackoverflow.com/questions/32508133/powershell-packagemanagement-how-to-uninstall-a-package-provider

## See Also

 * More about [package/module commands](../powershell/module_commands.md)
