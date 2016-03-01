# To pass an argument to a powershell script

For named parameters, first line in the script has to be a `param` declaration:

    param([string]$comment)

or to declare multiple named parameters    
    
    param(
        [string]$comment,
        [int32]$LicenseID
    )

Then you can do validation and exit, for example     
    
    if ($comment -eq "") {
        write-host "you must give a comment"
        exit
    }
    

    
Can also use a type of boolean parameter called a `switch`

    Param([switch]$IsGood)

Then $IsGood will be $false, unless the parameter was specified


    ".\script1.ps1"                 #  $IsGood = $false
    ".\script1.ps1 -IsGood"         #  $IsGood = $true
    ".\script1.ps1 -isGood:$true"   #  $IsGood = $true
    ".\script1.ps1 -isGood:$false"  #  $IsGood = $false


## Don't like named parameters? Fine use positional....

    
    $name=$args[0]    
    $height=$args[1]    
    
...like it's 1999.



## Source

 * http://stackoverflow.com/questions/5592531/how-to-pass-an-argument-to-a-powershell-script
 * http://powershell.org/wp/forums/topic/understanding-switch-parameters/

## See Also

 * [console: ndesk options](../console/ndesk_options.md) -- for doing the same in a C# console app.

