# How can I tell which version of powershell i have?

    $PSVersionTable.PSVersion

(Compared to this DOS class: `ver`)

So I've added this to my profile:

    function ver() {
         $PSVersionTable.PSVersion
    }
    
## See also    

 * http://stackoverflow.com/questions/1825585/determine-installed-powershell-version
