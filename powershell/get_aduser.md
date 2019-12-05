# get-aduser is useful to set info about a user account

TO see all of the properties of a user account (example account called "User1")

    get-aduser user1 -properties *

Or to view specific properties:

    get-user user1 -propeties  LockedOut, AccountLockoutTime

Or to output it to CSV (perhaps to append to a log file...)


    get-aduser user1 -properties LockedOut, AccountLockoutTime | convertto-csv -notypeinformation

If you *do* want to append it to a file then you'll want to skip the header row, e.g.

    get-aduser user1 -properties LockedOut, AccountLockoutTime | convertto-csv -notypeinformation | select -Skip 1 | Out-File $filenamestring -append

But I digress.