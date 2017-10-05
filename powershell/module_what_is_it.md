# What is a module?

> In its simplest form a module is a subfolder in one of the folders listed in $env:PSModulePath with a PowerShell script of the same name (but with the extension .psm1 instead of .ps1):
[source](https://stackoverflow.com/questions/27713844/dot-source-a-script-within-a-function)

The psm1 file ends with an `Export-ModuleMember` statement saying which functions and aliases to export., e.g.

	Export-ModuleMember -Function Get-Foo, New-Bar, ... -Alias gf, ..

