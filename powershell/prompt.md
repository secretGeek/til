#Powershell prompt

This is a powershell prompt i've been using for a while.
you put this in your [$PROFILE](create_profile.md)


    function prompt { 
        # LEON prompt in progress
        $cdelim = [ConsoleColor]::DarkCyan 
        $chost = [ConsoleColor]::DarkMagenta 
        $cloc = [ConsoleColor]::Cyan

        #
        # if the last command didn't give us a newline, take one.
        #
        if ($host.ui.RawUI.CursorPosition.X)
        {
            Write-Host
        }
        
        write-host ("$env:computername ") -n -f $chost 

        if ($HOME -ne "") {
            $path = ((pwd).Path) -replace [regex]::escape($HOME), '~'  # substitute tilde for home. case-insensitive
        } else {
            $path = ((pwd).Path)
        }
        
        $path = $path -replace '^[^:]+::', ''      # remove prefix for UNC paths 

        write-host $path -n -f $cloc 
        write-host '>' -n -f $cdelim 
        return ' ' 
    }
