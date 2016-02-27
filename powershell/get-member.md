# Get-Member is awesome

you use it to work out the properties (and methods and more) of an object

e.g.

    alias | get-member
    
    
    Name                MemberType     Definition
    ----                ----------     ----------
    Equals              Method         bool Equals(System.Object obj)
    GetHashCode         Method         int GetHashCode()
    GetType             Method         type GetType()
    ...
    PSProvider          NoteProperty   ProviderInfo PSProvider=Microsoft.PowerShell.Core\Alias
    CommandType         Property       System.Management.Automation.CommandTypes CommandType {get;}
    Definition          Property       string Definition {get;}
    DisplayName         ScriptProperty System.Object DisplayName {get=if ($this.Name.IndexOf('-') -lt 0)..

    
etc.    

Sometimes I think you use get-member like this:

    alias | % {get-member $_ }  

BUT NO -- that's not needed and it doesn't work.
