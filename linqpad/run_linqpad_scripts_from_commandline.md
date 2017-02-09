# Run Linqpad scripts from the command-line

> LINQPad now ships with lprun.exe which offers a full command-line experience.

> Note: if you've automatically upgraded from an older version of LINQPad, lprun.exe may not be present in your LINQPad folder. To get lprun.exe, download the latest LINQPad from www.linqpad.net. You can either re-install LINQPad, or download the standalone executable which includes lprun.exe.

Sounds promising. When reinstalling I saw the option (which was not selected by default... so be sure to select it)

> Add lprun.exe to system PATH (for command-line support)

And indeed after installing and restarting powershell:

    > (Get-Command lprun).Source
    C:\Program Files (x86)\LINQPad4\LPRun.exe

And...

    > $env:PATH.split(";")
    ...
    C:\Program Files (x86)\LINQPad4
    ...

Thereafter if i run:

    lprun .\calendar.linq

...it works as expected.

I've now wrapped this behavior up into the powershell commandlet [Invoke-LinqPadScript](invoke_linqpad_commandlet.md)



## Source

 * <https://www.linqpad.net/lprun.aspx>

## See Also

 * [Invoke-PowershellScript](invoke_linqpad_commandlet.md)