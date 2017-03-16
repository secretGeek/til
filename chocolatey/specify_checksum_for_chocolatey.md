# Giving Chocolatey a Checksum when creating a package

My package was failing validation with chocolatey, with the error message at the foot of this article.

The pertinent message being:

    ERROR: Empty checksums are no longer allowed by default for non-secure sources. 
    Please ask the maintainer to add checksums to this package.


Since I am the maintainer I had to ask myself... "How do I add checksums to this package" ??

I thought it would be about adding a &lt;`checksum`&gt; element to the `.nuspec` file, and I searched the documentation over and over.

In the end I realised that the trick was to alter the `ChocolateyInstall.ps1` file which is bundled into the package, and have it pass the checksum as a parameter when it calls `Install-ChocolateyZipPackage`

So the `ChocolateyInstall.ps1` used to look like this:


    $package = 'NimbleText'
    $drop = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    Install-ChocolateyZipPackage $package 'http://nimbletext.com/download/NimbleText.zip' $drop
    
Now I had to make it look like this (for example)

    $package = 'NimbleText'
    $drop = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    $checkSum = "CB546C6280E1359C94901BF460AFF237B00D529F73FCACB8F86AC568669DDDC4"
    Install-ChocolateyZipPackage $package 'http://nimbletext.com/download/NimbleText.zip' $drop -ChecksumType "sha256" -Checksum $checkSum

And since the checksum is different for every build, I need to make my build process **rewrite** that line `$checkSum =...` each time a release candidate was built.


For this, I created a script, `replace_hash.ps1` which calculated the checksum and wrote it to the file in the appropriate place. Like so:


    # Find the sha256 hash of NimbleText.zip
    $hashy = (checksum -t sha256 -f "output\NimbleText.zip")
    $hashyLine = '$checkSum = "' + $hashy + '"'
    $targetFile = 'Chocolatey-Packages\NimbleText\tools\ChocolateyInstall.ps1'
    $regex = '\$checkSum = "[0-9A-F]+"' 
    # Replace a line of "ChocolateyInstall.ps1" with that new hashy line
    (Get-Content $targetFile) -replace $regex, $hashyLine | Set-Content $targetFile


This relied on the `checksum` package, which I installed via:

    choco install checksum

...from an elevated command prompt. Though I could've also used [this Powershell script for finding the sha256 hash of a file](../powershell/get_filehash.md).



    
    
## Error Log
    
Email from moderation@chocolatey.org read:

    'PACKAGENAME' is Submitted.
    Current status = Waiting for Maintainer to take corrective action

    chocolatey-ops left the following comment(s):

    PACKAGENAME has failed automated testing.
    This is not the only check that is performed so check the package page to ensure a 'Ready' status.
    Please visit https://gist.github.com/...  for details.

    
And the gist at github had these errors... keyword to look for being 'checksum'    
    
    649 [DEBUG] - Verifying package provided checksum of '' for 'C:\Users\Administrator\AppData\Local\Temp\chocolatey\PACKAGENAME\2.8.0.38449\PACKAGENAME.zip'.
    680 [DEBUG] - Running Get-ChecksumValid -file 'C:\Users\Administrator\AppData\Local\Temp\chocolatey\PACKAGENAME\2.8.0.38449\PACKAGENAME.zip' -checksum '' -checksumType '' -originalUrl 'http://PACKAGENAME.com/download/PACKAGENAME.zip' 
    711 [WARN ] - WARNING: Missing package checksums are not allowed (by default for HTTP/FTP, 
     HTTPS when feature 'allowEmptyChecksumsSecure' is disabled) for 
     safety and security reasons. Although we strongly advise against it, 
     if you need this functionality, please set the feature 
     'allowEmptyChecksums' ('choco feature enable -n 
     allowEmptyChecksums') 
     or pass in the option '--allow-empty-checksums'. You can also pass 
     checksums at runtime (recommended). See choco install -? for details.
    711 [DEBUG] - If you are a maintainer attempting to determine the checksum for packaging purposes, please run 
     'choco install checksum' and run 'checksum -t sha256 -f C:\Users\Administrator\AppData\Local\Temp\chocolatey\PACKAGENAME\2.8.0.38449\PACKAGENAME.zip' 
     Ensure you do this for all remote resources.
    851 [WARN ] - The integrity of the file 'PACKAGENAME.zip' from 'http://PACKAGENAME.com/download/PACKAGENAME.zip' has not been verified by a checksum in the package scripts.
    851 [WARN ] - Do you wish to allow the install to continue (not recommended)?
    867 [WARN ] - [Y] Yes [N] No (default is "N")
    867 [WARN ] -   Confirmation (`-y`) is set.
      Respond within 30 seconds or the default selection will be chosen.
    929 [ERROR] - ERROR: Empty checksums are no longer allowed by default for non-secure sources. Please ask the maintainer to add checksums to this package. In the meantime if you need this package to work correctly, please enable the feature allowEmptyChecksums, provide the runtime switch '--allow-empty-checksums', or pass in checksums at runtime (recommended - see 'choco install -?' / 'choco upgrade -?' for details). It is strongly advised against allowing empty checksums for non-internal HTTP/FTP sources.
     at Get-ChecksumValid, C:\ProgramData\chocolatey\helpers\functions\Get-CheckSumValid.ps1: line 167
    at Get-ChocolateyWebFile, C:\ProgramData\chocolatey\helpers\functions\Get-ChocolateyWebFile.ps1: line 377
    at Install-ChocolateyZipPackage, C:\ProgramData\chocolatey\helpers\functions\Install-ChocolateyZipPackage.ps1: line 189
    at <ScriptBlock>, C:\ProgramData\chocolatey\lib\PACKAGENAME\tools\ChocolateyInstall.ps1: line 4
    at <ScriptBlock>, C:\ProgramData\chocolatey\helpers\chocolateyScriptRunner.ps1: line 48
    at <ScriptBlock>, <No file>: line 1
    945 [DEBUG] - Built-in PowerShell host called with ['[System.Threading.Thread]::CurrentThread.CurrentCulture = '';[System.Threading.Thread]::CurrentThread.CurrentUICulture = ''; & import-module -name 'C:\ProgramData\chocolatey\helpers\chocolateyInstaller.psm1'; & 'C:\ProgramData\chocolatey\helpers\chocolateyScriptRunner.ps1' -packageScript 'C:\ProgramData\chocolatey\lib\PACKAGENAME\tools\ChocolateyInstall.ps1' -installArguments '' -packageParameters '''] exited with '-1'.
    961 [DEBUG] - Calling command ['"C:\Windows\System32\shutdown.exe" /a']
    023 [DEBUG] - Command ['"C:\Windows\System32\shutdown.exe" /a'] exited with '1116'
    476 [DEBUG] - Capturing package files in 'C:\ProgramData\chocolatey\lib\PACKAGENAME'
    476 [DEBUG] -  Found 'C:\ProgramData\chocolatey\lib\PACKAGENAME\PACKAGENAME.nupkg'
      with checksum 'D577935C52EC529427A394C7F47D3F02'
    476 [DEBUG] -  Found 'C:\ProgramData\chocolatey\lib\PACKAGENAME\PACKAGENAME.nuspec'
      with checksum '5A23F371DD373C8D89A0504271B68738'
    492 [DEBUG] -  Found 'C:\ProgramData\chocolatey\lib\PACKAGENAME\tools\ChocolateyInstall.ps1'
      with checksum 'CEC2FBBC5BE9B74E6259EB926C73952A'
    492 [DEBUG] -  Found 'C:\ProgramData\chocolatey\lib\PACKAGENAME\tools\PACKAGENAME.com'
      with checksum '4827432C0CC72960018E9B6756D8E96D'
    492 [DEBUG] -  Found 'C:\ProgramData\chocolatey\lib\PACKAGENAME\tools\PACKAGENAME.exe.gui'
      with checksum 'D41D8CD98F00B204E9800998ECF8427E'
      
## See also

 * [Powershell script for finding the sha256 hash of a file](../powershell/get_filehash.md)
 * [Replace a line in a file](../powershell/replace_a_line_in_a_file.md)