# Write-Host considered Harmful, so what should we do?

Jeffrey Snover says [Write-Host Considered Harmful](http://www.jsnover.com/blog/2013/12/07/write-host-considered-harmful/)

In summary:

 * For **RESULTS** of an operation use "Write-Output"
 * For **Messages** use Write-Verbose

Hmmm.

But `Write-Output` doesn't let you specify `nonewline` and the relevant color.

I love those things a lot!

Perhaps `Write-Host` *is* the right thing for a lot of my usages.

Scripting guys recommend this approach to changing text color when using Write-Output:



    $t = $host.ui.RawUI.ForegroundColor
    $host.ui.RawUI.ForegroundColor = "DarkGreen"
    Write-Output "this is green output"
    $host.ui.RawUI.ForegroundColor = $t

Really?


And someone provides this helpful example on stackoverflow of wrapping it into a "Write-ColorOutput" function.    

    function Write-ColorOutput($ForegroundColor)
    {
        # save the current color
        $fc = $host.UI.RawUI.ForegroundColor

        # set the new color
        $host.UI.RawUI.ForegroundColor = $ForegroundColor

        # output
        if ($args) {
            Write-Output $args
        }
        else {
            $input | Write-Output
        }

        # restore the original color
        $host.UI.RawUI.ForegroundColor = $fc
    }

    # test
    Write-ColorOutput red (ls)
    Write-ColorOutput green (ls)
    ls | Write-ColorOutput yellow


It doesn't solve the no new line feature, and it is horribly un-parallel-able (if you lose sleep over that kind of thing like some of my buddies)

So here's what I'm going to do:

Keep on using `Write-host` for a little longer, if I am using colors or `nonewline` flag. Yes I am.

(And I reserve the right to change this at any second.)
    
Tag: Don't follow me I'm lost too.    
    
## Source

 * [Write-Host Considered Harmful](http://www.jsnover.com/blog/2013/12/07/write-host-considered-harmful/)
 * [Scripting Guys: PowerTip: Write PowerShell Output in Color Without Using Write-Host](https://blogs.technet.microsoft.com/heyscriptingguy/2012/10/11/powertip-write-powershell-output-in-color-without-using-write-host/)    
 * [SO: Is there a way to specify a font color when using write-output](http://stackoverflow.com/questions/4647756/is-there-a-way-to-specify-a-font-color-when-using-write-output)