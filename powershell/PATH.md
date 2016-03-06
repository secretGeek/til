# PATH: getting it, adding to it and managing it

The PATH is a semi-colon separated list of locations that the OS will search when trying to lcoate an executable program.

## Getting it

To get the current PATH environment variable:

    $env:path

(or in `cmd.exe` just `%path%`, or in Windows, see [Environment variables -- view/edit them on windows](../windows/environment_variables.md))


To split the path into its constituents:

    $env:path.Split(";")

or

    $env:path.Split(";", [System.StringSplitOptions]::RemoveEmptyEntries)



## Adding to it

To add a folder to the `PATH`, only for the **current session**:

    $env:path += [System.IO.Path]::PathSeparator + $NewPath

(To get the current folder:  $NewPath = Get-Location

To persist the current session's path (requires admin)

    [Environment]::SetEnvironmentVariable( "Path", $env:Path, [System.EnvironmentVariableTarget]::Machine )




## See also

 * [Environment variables -- view/edit them on windows](../windows/environment_variables.md)