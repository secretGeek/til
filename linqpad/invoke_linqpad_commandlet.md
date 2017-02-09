# Invoke a LinqPad Script with Invoke-LinqPadScript CommandLet

Since you can [Run Linqpad scripts from the command-line](run_linqpad_scripts_from_commandline.md) I made a short wrapper that lets you invoke scripts in a dedicated LinqPad script folder. (Assuming it is a directory caled `linqPad` under your `utils` folder.

    function Invoke-LinqPadScript
    {
        [CmdletBinding()]
        Param
        (
            [parameter(mandatory=$true, position=0)][string]$ScriptName,
            [parameter(mandatory=$false, position=1, ValueFromRemainingArguments=$true)]$AllArgs
        )

        if (!(Get-Command "lprun" -errorAction SilentlyContinue)) {
            write-host "You need lprun.exe, on the PATH, to be able to use this module." -foregroundcolor "red"
            return;
        }

        $fullScriptPath = ("{0}\linqpad\{1}.linq" -f $env:util, $ScriptName);

        if (!(test-path $fullScriptPath)) {
            write-host  ("No script found " + $fullScriptPath) -foregroundcolor "red"
            return;
        }

        & lprun $fullScriptPath $AllArgs
    }


And the recommended alias for that is `linq`. So, you can invoke a LinqPad script called `Calendar.linq` by typing:

    linq calendar


Also, I've got a Get-LinqPadScript commandlet for quickly listing the available scripts.

    function Get-LinqPadScript
    {
        [CmdletBinding()]
        Param
        (
            [parameter(mandatory=$false, position=0)][string]$ScriptName
        )

        $linqPadScriptPath = ("{0}\linqpad" -f $env:util);

        if ($scriptName -ne $null) {
            Get-ChildItem $linqPadScriptPath  *.linq |
                ? { $_.BaseName -match $scriptName } |
                Format-Table -property  @{Expression={$_.BaseName};Label="Script"} -auto
        } else {
            Get-ChildItem $linqPadScriptPath  *.linq |
                Format-Table -property  @{Expression={$_.BaseName};Label="Script"} -auto
        }
    }

The recommended alias for that is `linqs`, so if you try, `linqs sql` you'll see any script with 'sql' in the [BaseName](../powershell/parts_of_a_fileSystemInfo_object.md).


Putting better support for this into linqPad is a uservoice suggestion [Create Invoke-LinqPad Cmdlet for powershell](https://linqpad.uservoice.com/forums/18302-linqpad-feature-suggestions/suggestions/7408081-create-invoke-linqpad-cmdlet-for-powershell) where a commenter has included a basic example http://pastebin.com/tNGQgBEe

## See also

 * [Run Linqpad scripts from the command-line](run_linqpad_scripts_from_commandline.md)