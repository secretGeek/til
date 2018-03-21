## Which w3wp.exe process is which?


You have multiple w3wp.exe processes in Task Manager, and *one* of them is pegging the CPU. Which application pool is it?

In Task manager, processes tab, select columns and show: 

 * "command line" and 
 * "pid"

"Command Line" will reveal the application pool, e.g.

    c:\windows\system32\inetsrv\w3wp.exe -ap "MyWebApp" -v "v4.0" -l "webengine4.dll" -a \\, \pipe\iisipmdguid -h "c:\inetpub\temp\apppools\MyWebApp\MyWebApp.config" -w "" -m 0 -t 60

The `-ap` parameter is the app pool, in the example above: "MyWebApp"


A more "IIS" specific way to get this same information...

Run this command to see a map from Process ID to application pools:

    %systemroot%\system32\inetsrv\appcmd list wp
    
    
If that doesn't work, try:

    c:\windows\system32\cscript c:\windows\system32\iisapp.vbs
    
## Source

 * Original research
 * [How can I determine which w3wp.exe process belongs to which web site?](http://stackoverflow.com/questions/658749/how-can-i-determine-which-w3wp-exe-process-belongs-to-which-web-site)