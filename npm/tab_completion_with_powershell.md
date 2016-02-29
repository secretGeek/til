# npm tab completion with powershell

Want intellisense for `npm` from within powershell? [Doug Finke](http://dougfinke.com/blog/3-ways-to-speed-up-visual-studio-code-extension-development/) has it covered.

In [powershell](../powershell/01_summary.md) [version](../powershell/version.md) 5 from an elevated prompt:

    Find-Module TabExpansionPlusPlus -repository PsGallery | Install-Module -Scope AllUsers
    Find-Module NPMTabCompletion -repository PsGallery | Install-Module -Scope AllUsers

From a freshly opened prompt (that does not need to be elevated)
    
    Import-Module TabExpansionPlusPlus
    Import-Module NPMTabCompletion    

**You will also need to either add those commands either to your [profile](../powershell/create_profile.md), or run them in ever powershell session where you want `npm` tab completion to work.**

This not only gives you intellisense-style completion for `npm` commands, it also looks in a local package.json file to see if there are any commands you've specified locally.

![npm tab completion](NPMTabRun2.gif 'npm tab completion')

    

## Trouble-shooting....

1. Did you get this error from Install-Module ?

> Install-Module : A parameter cannot be found that matches parameter name 'Name'.
    
It may be that you have [the wrong Install-Module](../powershell/psget_conflicts_with_PowerShellGet.md)!



2. Did you get this error from Find-Module ?

> NuGet provider is required to continue

You need to install the NuGet Package Provider. 

    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force


## External Sources
    
 * Doug blog post on it: http://dougfinke.com/blog/3-ways-to-speed-up-visual-studio-code-extension-development/
 * Here's the source code: https://github.com/dfinke/NPMTabCompletion
    
## See also

 * More about [package/module commands](../powershell/module_commands.md)
