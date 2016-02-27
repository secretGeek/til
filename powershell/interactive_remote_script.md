# Want to prompt user for credentials and then run a script on a remote machine?


Assuming the Remote Computer Name is stored in a variable `$remoteComputerName`


    $name = Read-Host ("What is the account name to use for remote execution, please include the domain, e.g. AD\" + $env:username + ")")

    Invoke-Command -ComputerName $remoteComputerName -ScriptBlock { 

        # Commands in here are remote executed, hence relative to $remoteComputerName

    } -credential $name



    