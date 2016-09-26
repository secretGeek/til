# How can I tell which version of powershell I have?

    $PSVersionTable.PSVersion

(Compared to this DOS classic: `ver`)

So I've added this to my profile:

    function ver() {
         $PSVersionTable.PSVersion
    }

But you might also need to consider where the [currently running shell is 64 or 32 bit](is_this_64_or_32_bit_powershell_today.md), and [is powershell running as admin?](is_current_user_admin.md). 

Or if you want to know the [windows version, I've covered that too](../windows/which_version.md).
    
## Source

 * http://stackoverflow.com/questions/1825585/determine-installed-powershell-version

