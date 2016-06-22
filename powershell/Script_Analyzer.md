# Use Script Analyzer to Find Style Problems with your Scripts


Script analyzer finds errors and gives warnings about your dodgy scripts.

First you need to install it:

If running as admin:


    Install-Module -Name PSScriptAnalyzer -force

Otherwise:
    
    Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force

    
Then you can either run it against a specific script:

    Invoke-ScriptAnalyzer $profile

or against an entire path... and you can include subfolders by using -recurse    
    
    Invoke-ScriptAnalyzer -Path ($pwd).Path -recurse
    

    
RuleName                            Severity     FileName   Line  Message
--------                            --------     --------   ----  -------
PSAvoidUsingCmdletAliases           Warning      Microsoft. 11    'cd' is an alias of 'Set-Location'. Alias can introduce
                                                 PowerShell       possible problems and make scripts hard to maintain. Please
                                                 _profile.p       consider changing alias to its full content.
                                                 s1
PSAvoidUsingCmdletAliases           Warning      Microsoft. 12    'dir' is an alias of 'Get-ChildItem'. Alias can introduce
                                                 PowerShell       possible problems and make scripts hard to maintain. Please
                                                 _profile.p       consider changing alias to its full content.
                                                 s1
    