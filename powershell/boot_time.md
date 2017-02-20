# Find last boot time

When did we last reboot this machine? What's the current uptime? How long since boot, since reboot, since last boot, since last reboot?

In powershell 2:

    Get-WmiObject win32_operatingsystem | select csname, @{LABEL='LastBootUpTime';EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}
    
In Powershell 3+

    Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime    
    
    

## Source

 * [PowerTip: Get the Last Boot Time with PowerShell](https://blogs.technet.microsoft.com/heyscriptingguy/2013/03/27/powertip-get-the-last-boot-time-with-powershell/)