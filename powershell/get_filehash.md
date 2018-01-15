# Calculate sha256 filehash of a file

PowerShell 4+ includes a built-in `Get-FileHash` commandlet that does this for you:

	get-filehash "c:\temp\nimbleset.exe"

But if you're stuck on PowerShell 2 because your corporate IT department take the "if it ain't broke don't fix it" approach to life, then this snippet will help you out


Powershell 2 code to calculate the sha256 hash of a file


	$someFilePath = "c:\temp\nimbleset.exe"
	$sha256 = New-Object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider
	$hash = [System.BitConverter]::ToString($sha256.ComputeHash([System.IO.File]::ReadAllBytes($someFilePath))).Replace('-','')
	$hash


Or to calculate the md5 hash (often used as a checksum)


	$someFilePath = "c:\temp\nimbleset.exe"
	$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
	$hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($someFilePath))).Replace('-','')
	$hash


Here's the Powershell 4+ equivalent (defaults to sha256)

	$hash = (get-filehash "c:\temp\nimbleset.exe" | % hash)

Or for MD5...

	$hash = (get-filehash "c:\temp\nimbleset.exe" -algo md5 | % hash)



## Large files?

Although the above worked fine for my use case, comments from stackoverflow show how it can be done without loading the whole file at once, with the use of streams (and they also point out you need to close the stream)


	$someFilePath = "c:\temp\nimbleset.exe"
	$sha256 = New-Object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider;
	$stream = [System.IO.File]::Open($someFilePath, [System.IO.Filemode]::Open, [System.IO.FileAccess]::Read);
	$hash2 = [System.BitConverter]::ToString($sha256.ComputeHash($stream)).Replace('-','');
	$stream.Close();
	$hash2;


## Another way: Certutil


	$(CertUtil -hashfile "c:\temp\nimbleset.exe" SHA256)[1] -replace " ",""


## Use the hash to check VirusTotal

And why are we doing this? To check VirusTotal for example:


	$url = "https://www.virustotal.com/en/file/$hash/analysis"



## Source

 * [How to get an MD5 checksum in PowerShell](http://stackoverflow.com/questions/10521061/how-to-get-an-md5-checksum-in-powershell)
