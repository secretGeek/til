# Virtual Box requires Hyper-V to be disabled

In virtualbox if you only have options to create 32 bit VMs... Why is that!?
        
It's because virtual box requires that Hyper-V be disabled.


Now I'm checking: if i disable Hyper-V can I re-enable it later?
        
    dism.exe /Online /Disable-Feature:Microsoft-Hyper-V
    
    dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All



You need to be running 64-bit powershell, elevated.

If you're not elevated, you'll get:

    > dism.exe /Online /Disable-Feature:Microsoft-Hyper-V
    
    Error: 740

    Elevated permissions are required to run DISM.
    Use an elevated command prompt to complete these tasks.


...so elevate.    


And if you're not running 64-bit powershell, you'll get:


    > dism.exe /Online /Disable-Feature:Microsoft-Hyper-V

    Deployment Image Servicing and Management tool
    Version: 10.0.10586.0

    
    Error: 11

    You cannot service a running 64-bit operating system with a 32-bit version of DISM.
    Please use the version of DISM that corresponds to your computer's architecture.

    The DISM log file can be found at C:\WINDOWS\Logs\DISM\dism.log

    

So run from an elevated 64-bit version of Powershell.
    
    
    > dism.exe /Online /Disable-Feature:Microsoft-Hyper-V

    Deployment Image Servicing and Management tool
    Version: 10.0.10586.0

    Image Version: 10.0.10586.0

    Disabling feature(s)
    [==========================100.0%==========================]
    The operation completed successfully.
    Restart Windows to complete this operation.
    Do you want to restart the computer now? (Y/N)

Restart the computer.

    
Now when you open Virtual Box there's a bunch of 64 bit machines you can create.


(I downloaded this image: http://mirror.aarnet.edu.au/pub/xubuntu/releases/14.04/release/xubuntu-14.04.3-desktop-amd64.iso)
    

## See Also
 
 * [Is this 64 or 32 bit PowerShell today?](../powershell/is_this_64_or_32_bit_powershell_today.md) 
 * [To test if the current user is an admin](../powershell/is_current_user_admin.md)
 * [For a new process to runas a different (admin) user from powershell](../powershell/runas.md)