# Repeat every second

repeat a command, on a loop, so you can monitor a process 



This example will show you the file size, every second (expressed in GB)

    while($true) { dir *wellsrv* | % { $_.Length / 1gb; sleep 1} }

Here's one that shows the current time, the file name and size every 20 seconds 


   while($true) { dir outputlog.txt | % { 
                "" +  (get-date -f "yyyy-MM-dd HH:mm:ss") + 
				": " + ($_.Name) + 
				", " + ($_.Length / 1gb) + 
				" GB"; 
				sleep 30
				} 
	}