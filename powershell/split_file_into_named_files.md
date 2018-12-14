# Split file into named files

Given an input file like this:

	FILE:Hello.txt
	content
	content
	FILE:Hello2.txt
	content3
	content4

You can split it into two files, named `Hello.txt` and `Hello2.txt` by using the following line of powershell....


	get-content .\file1.txt |
		foreach {
			if ($_ -like 'FILE:*') {
				# Set the filename based on the token
				$file = ($_ -split ':')[1];
				# (consider: delete the file at this point, if it already exists)
			} else {
				# Append to the file. Assumes we've already set a filename
				$_ |
					out-file -append $file
			}
		}

Here's a shorter version of the same script (using common aliases)

	cat .\file1.txt | % { if ($_ -like 'FILE:*') { $file = ($_ -split ':')[1]}} else { $_ | out-file -append $file } }

