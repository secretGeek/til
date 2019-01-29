# Difference between two dates (using powershell)



    $StartDate = '15/02/2016 10:31:41 AM';
    $EndDate = (Get-Date);
    NEW-TIMESPAN –Start $StartDate –End $EndDate
    
    Days              : 381
    Hours             : 0
    Minutes           : 15
    Seconds           : 37
    Milliseconds      : 816
    Ticks             : 329193378169011
    TotalDays         : 381.010854362281
    TotalHours        : 9144.26050469475
    TotalMinutes      : 548655.630281685
    TotalSeconds      : 32919337.8169011
    TotalMilliseconds : 32919337816.9011
    
    

## Source

 * [Get Time Difference between Dates with PowerShell](https://blogs.technet.microsoft.com/heyscriptingguy/2013/12/28/powertip-get-time-difference-between-dates-with-powershell/)
 
## Keywords

* DateDiff