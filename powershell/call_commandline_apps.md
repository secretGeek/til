# How to call command line apps like a powershell pro....

Call command line apps via powershell like this:

    $arguments = @("/i", $msiInstallPath, "/L* $msiInstallPath.log", "/qn", "/norestart")
    $process = Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait -PassThru

That's how the professional do it. And so should you. Allegedly.