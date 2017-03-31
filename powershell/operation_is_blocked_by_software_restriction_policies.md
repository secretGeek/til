# operation is blocked by software restriction policies

On loading my [profile](create_profile.md) on a new machine, as a mortal account, I would suffer this problem:

> File cannot be loaded because its operation is blocked by software restriction policies, such as those created by using Group Policy


When running as admin I did not get the same issue.

When running as a mortal account:

    Get-ExecutionPolicy -List

...showed me that the execution policy was `RemoteSigned`

Right clicking on the file in explorer, and viewing properties, I expected to see an "Unblock" button -- but there was no such button.

The trick was... it was a 0 byte file! It had been created but never populated. So I deleted the file, and all was good.


## See Also

 * [create profile](create_profile.md)
