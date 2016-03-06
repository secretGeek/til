# PsGet Conflicts with PowershellGet

There's a new microsoft thing called PowershellGet which lets you install modules from various places.

There's a different, pre-existing thing called PsGet which is a community provided tool for the same sort of stuff.

They both expose commands called install-module and probably some others that collide.

If you have PsGet, and you want Microsoft's PowershellGet to work you have to remove PsGet.


    > Get-Command Install-Module

    CommandType     Name                                               Version    Source
    -----------     ----                                               -------    ------
    Function        Install-Module                                     0.0        PsGet



The first clue I had that this problem was occurring was due to these errors:

    > Install-Module -Name NPMTabCompletion
    Install-Module : A parameter cannot be found that matches parameter name 'Name'.


And

    > Install-Module NPMTabCompletion
    Module NPMTabCompletion was not found in central repository

I didn't realise this was a problem, because although PsGet has a 'central repository' (mentioned above) the front page of Powershell Gallery uses those same magic words:

> The PowerShell Gallery is the central repository for PowerShell content



To remove PsGet:

Go to:

    "$home\Documents\WindowsPowerShell\Modules"

    (e.g. C:\Users\Agatha\Documents\WindowsPowerShell\Modules)

And *delete* the PsGet folder. (Or move it somewhere far away if that makes you more comfortable)


Now when you type:

    which install-module

Expect to see:

    CommandType     Name                                               Version    Source
    -----------     ----                                               -------    ------
    Function        Install-Module                                     1.0.0.1    PowerShellGet



## Source

 * http://superuser.com/questions/996417/what-is-install-module-command-in-powershell

## See Also

 * More about [package/module commands](../powershell/module_commands.md)
