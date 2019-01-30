# How to determine password complexity rules (from powershell)

If you receive an error such as:

	Set-ADAccountPassword : The password does not meet the length, complexity, or history requirement of the domain.
	
(When using `Set-ADAccountPassword` to [set your password with powershell](update_password.md) -- then you can check the complexity rules with:


	Get-ADDefaultDomainPasswordPolicy
	
It gives results like this:

	> Get-ADDefaultDomainPasswordPolicy


	ComplexityEnabled           : True
	DistinguishedName           : DC=YourDomain,DC=com
	LockoutDuration             : 00:00:00
	LockoutObservationWindow    : 69.10:39:00
	LockoutThreshold            : 5
	MaxPasswordAge              : 35.00:00:00
	MinPasswordAge              : 2.00:00:00
	MinPasswordLength           : 14
	objectClass                 : {domainDNS}
	objectGuid                  : 3494e3c6-85cf-2809-9583-b6aa64e1afd3
	PasswordHistoryCount        : 14
	ReversibleEncryptionEnabled : False


	
...I think in my case the 'MinPasswordAge' might be what's tripping me up... I'm trying to change a password that is 0 days old.




> MinPasswordAge: Specifies the minimum length of time before you can change a password.



## Source


* [Docs: Set-ADDefaultDomainPasswordPolicy](https://docs.microsoft.com/en-us/powershell/module/addsadministration/set-addefaultdomainpasswordpolicy?view=win10-ps)

## See also

* [How do you update a password via powershell (solved)](update_password.md)