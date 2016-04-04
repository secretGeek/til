# To pass an argument to a powershell script

For named parameters, first line in the script has to be a `param` declaration:

    param([string]$comment)

or to declare multiple named parameters    
    
    param(
        [string]$comment,
        [int32]$LicenseID
    )

Then you can do validation and handle gracefully, for example     
    
    if ($comment -eq "") {
        write-host "you must give a comment"
        exit
    }
    
A simple if brutal way to bail if a required argument was not specified

    param ( [string]$comment = $(throw "Please specify a comment" ))
    
    
Can also use a type of boolean parameter called a `switch`

    Param([switch]$IsGood)

Then $IsGood will be $false, unless the parameter was specified


    ".\script1.ps1"                 #  $IsGood = $false
    ".\script1.ps1 -IsGood"         #  $IsGood = $true
    ".\script1.ps1 -isGood:$true"   #  $IsGood = $true
    ".\script1.ps1 -isGood:$false"  #  $IsGood = $false


## Don't like named parameters? Fine! Use positional...

    
    $name=$args[0]    
    $height=$args[1]    
    
...like it's 1999.


## Validate the parameters...

But if you do use real `params` you can also enforce simple validation:

For example -- string, length from 1 to 10...

    Param(
        [ValidateLength(1,10)][string]$string
    )

Or how about a number that must be within a range...


   Param(
        [ValidateRange(0,10)][int]$integer
    )
    
What about -- a filename that must be an existing file...


    Param(
        [ValidateScript({Test-Path $_})][string]$smolibrary
    )    
    

## Source

 * http://stackoverflow.com/questions/5592531/how-to-pass-an-argument-to-a-powershell-script
 * http://powershell.org/wp/forums/topic/understanding-switch-parameters/
 * https://www.mssqltips.com/sqlservertip/4198/validating-powershell-parameters--part-i/

## See Also

 * [console: ndesk options](../console/ndesk_options.md) -- for doing the same in a C# console app.

