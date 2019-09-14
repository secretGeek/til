# Delete files older than 90 days

First, list files older than 90 days...

	find . -mtime +90 -type f

(note, could specify a specific/absolute folder instead of "." for current folder)

Note `-type f` means "files"

Happy with the result? Add a `-delete` parameter to delete those files. So long, files!

	find . -mtime +90 -type f -delete
