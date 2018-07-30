# Find Deleted Files in Mercurial

To find which revision a file was deleted in, use 

	hg log --template "{rev}: {file_dels}\n"

...which outputs file deletion info from every revision. i.e. a list of every revision, and the names of any files that were deleted during that revision (if any)

It looks like this:


	388:
	387:
	386: TIL/.net-core-MVC/UrlEncode.md TIL/.net-core-MVC/UrlParameter-Optional.md TIL/.net-core-MVC/ip_address.md
	385:
	384:
	383:

Then you can grep those details to find the deleted file you're interested in, and see when it was deleted.

You can then browse to the specific revision, via tortoise hg, `thg.exe`.

