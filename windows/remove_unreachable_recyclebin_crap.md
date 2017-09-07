# Remove unreachable recycle bin crap

On a networked (work) computer that has been used by a lot of other users, I was running low on hard drive space.

Running spacesniffer (as admin) I saw that there were 26+ GB of files under `C:\$Recycle.Bin` -- even though I had already emptied the hard drive.

I reasoned that these were things the other users had put in the recycle bin. Or the recycle bin was in some way corrupted. 

I don't care why -- I just need lots of space in a hurry to complete a task with a tight deadline.

The solution 

from an **elevated** command prompt and then

	rd /s/q c:\$Recycle.Bin

Output:


	C:\>rd /s/q c:\$Recycle.Bin
	The directory is not empty.

	C:\>rd /s/q c:\$Recycle.Bin

	
(I had to run it twice.)	
	
	
## Sources

 * [Recycle Bin Corrupted - Cannot Delete File or Folder](https://www.vistax64.com/tutorials/131294-recycle-bin-corrupted-cannot-delete-file-folder.html)
 
 ## See also
 
 * [runas](../powershell/runas.md)