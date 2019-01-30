# How do you update a password via powershell (solved)

	$username = "Jane.Doe"
	$oldpassword = "OldPasswordHere"
	$newpassword = "NewPasswordHere"
	Set-ADAccountPassword -Identity $username -OldPassword (ConvertTo-SecureString -AsPlainText $oldpassword -Force) -NewPassword (ConvertTo-SecureString -AsPlainText $newpassword -Force)

To see how many days until expiry:

	(([datetime]::FromFileTime((Get-ADUser –Identity $username -Properties "msDS-UserPasswordExpiryTimeComputed")."msDS-UserPasswordExpiryTimeComputed"))-(Get-Date)).Days


All of this requires the `Active Directory` module in powershell.

Exactly how to make that a part of your windows install seems to vary from one minor version to the next. [Try this guide](https://4sysops.com/wiki/how-to-install-the-powershell-active-directory-module/).



## See also

* [How to determine password complexity rules (from powershell)](password_complexity.md)