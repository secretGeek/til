# Store and use password via secure string


	write-host "Please enter your password for me to handle with care:"
	read-host -assecurestring | convertfrom-securestring | out-file C:\wip\securePassword.txt
	$password = (get-content C:\wip\securePassword.txt | convertto-securestring)
	$credentials = new-object -typename System.Management.Automation.PSCredential -argumentlist "myusername",$pass


You can then use `$credentials` in whatever way you wish, e.g.

	$remoteSession = New-PSSession -ComputerName $TargetServer -Credential $credentials
	Invoke-Command -Session $remoteSession {
		write-host "I'm on the remote computer."
	}	
	
If you want to view that `$password` as plain text, it's not too easy:
	
	$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
	$plainText =  [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

	

## Sources

* [Powershell Tip – Storing and Using Password Credentials](https://blogs.technet.microsoft.com/robcost/2008/05/01/powershell-tip-storing-and-using-password-credentials/)

