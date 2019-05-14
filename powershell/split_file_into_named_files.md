# Split file into named files

Given an input file like this:

	FILE:Hello.txt
	content (this will end up in Hello.txt)
	content (this will end up in Hello.txt)
	FILE:Hello2.txt
	content3 (this will end up in Hello2.txt)
	content4 (this will end up in Hello2.txt)

You can split it into two files, named `Hello.txt` and `Hello2.txt` by using the following line of powershell....


	get-content .\file1.txt |
		foreach {
			if ($_ -like 'FILE:*') {
				# Set the filename based on the token
				$file = ($_ -split ':')[1].Trim();
				# (consider: delete the file at this point, if it already exists)
				if (test-path $file) {del $file}
			} else {
				# Append to the file. Assumes we've already set a filename
				$_ |
					out-file -append $file -encoding Unicode
			}
		}

Here's a shorter version of the same script (using common aliases)

	cat .\file1.txt | % { if ($_ -like 'FILE:*') { $file = ($_ -split ':')[1];if (test-path $file) {del $file}} else { $_ | out-file -append $file Unicode } }

