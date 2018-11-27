# Repeat every n seconds forever

Repeat a command, on a loop, so you can monitor a process.

I wanted to repeat this every 5 seconds:

    dir . *.* -recurse | measure | % Count

    
And used this command to achieve it:
    
	cls; while ($true) { dir . *.* -recurse | measure | % Count; start-sleep -seconds 5; }



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


Here's one that shows how much space is left on the drive...

	while (1) { 
		get-psdrive C | 
			% { 
				"" + "{0:0.00}" -f ($_.Used/1GB) + " used, " + 
				"{0:0.00}" -f ($_.Free/1GB)   + " free"
			}; 
			sleep 3;
	}



## See also

* [example of using 'watch' in linux](../linux/how_much_memory_is_free.md)
