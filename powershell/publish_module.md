# How to publish a module

For now -- this is based entirely on [Building a PowerShell Module](http://ramblingcookiemonster.github.io/Building-A-PowerShell-Module/) by Warren Frame.

1. Create a module (.psm1)
2. Create a module manifest (using New-ModuleManifest)
3. Register at PowershellGallery, and get an API key
4. Publish using Publish-Module


## Create a module (.psm1)

This is just a script file but with a .psm1 extension, and an 'export-moduleMember' declaration(s) at the end, for example:

    export-modulemember *-*
    
...means export every function that has a hyphen in the name, i.e. standard cmdLet syntax.

You can also individually specify the functions to be exported.
    
    Export-modulemember -function Invoke-CupHolder

    
## Create a module manifest.

A module manifest is a script with a ".psd1" extension. It describes the module, and is needed for publication.

    
    $Path = 'C:\sc\PSStackExchange'
    $ModuleName = 'PSStackExchange'
    $Author = 'RamblingCookieMonster'
    $Description = 'PowerShell module to query the StackExchange API'

    # Create the module and private function directories
    mkdir $Path\$ModuleName
    mkdir $Path\$ModuleName\Private
    mkdir $Path\$ModuleName\Public
    mkdir $Path\$ModuleName\en-US # For about_Help files
    mkdir $Path\Tests

    #Create the module and related files
    New-Item "$Path\$ModuleName\$ModuleName.psm1" -ItemType File
    New-Item "$Path\$ModuleName\$ModuleName.Format.ps1xml" -ItemType File
    New-Item "$Path\$ModuleName\en-US\about_PSStackExchange.help.txt" -ItemType File
    New-Item "$Path\Tests\PSStackExchange.Tests.ps1" -ItemType File
    New-ModuleManifest -Path $Path\$ModuleName\$ModuleName.psd1 `
                       -RootModule $Path\$ModuleName\$ModuleName.psm1 `
                       -Description $Description `
                       -PowerShellVersion 3.0 `
                       -Author $Author `
                       -FormatsToProcess "$ModuleName.Format.ps1xml"
                       



## Register at PowershellGallery, and get an API key

To publish it to the [Powershell Gallery](https://www.powershellgallery.com/) you'll need to register yourself as a user there, and then you'll need an API key. Once registered, you'll find your API key here: https://www.powershellgallery.com/account

Once you have your API key, please remember to keep it secret for if it falls into enemy hands, then god help us all.


## Publish using Publish-Module


    # This assumes you are running PowerShell 5

    # Parameters for publishing the module
    $Path = 'C:\Folder\Containing\Your\Module'
    $PublishParams = @{
        NuGetApiKey = 'REDACTED!' # Swap this out with your API key
        Path = 'C:\SC\PSStackExchange\PSStackExchange'
        ProjectUri = 'https://github.com/RamblingCookieMonster/PSStackExchange'
        Tags = @('StackExchange', 'StackOverflow', 'REST', 'API' )
    }

    # We install and run PSScriptAnalyzer against the module to make sure it's not failing any tests
    # As admin:
    Install-Module -Name PSScriptAnalyzer -force
    Invoke-ScriptAnalyzer -Path $Path
    
    # Or if not as admin...
    Install-Module -Name PSScriptAnalyzer -Scope CurrentUser
    Invoke-ScriptAnalyzer -Path $Path
    

    # ScriptAnalyzer passed! Let's publish
    Publish-Module @PublishParams

    # The module is now listed on the PowerShell Gallery
    Find-Module PSStackExchange



## Source

 * [Building a PowerShell Module](http://ramblingcookiemonster.github.io/Building-A-PowerShell-Module/) by Warren Frame.