# Backup remote folders with rsync

  rsync option source-directory destination-directory
  

Or, a better example:
  
	rsync -chavzP --stats user@remote.host:/path/to/copy /path/to/local/storage  

And here's the full [explain shell explanation](https://explainshell.com/explain?cmd=rsync+-chavzP+--stats+user%40remote.host%3A%2Fpath%2Fto%2Fcopy+%2Fpath%2Fto%2Flocal%2Fstorage)

`chavzP` is, respectively:

 * `--checksum`
 * `--human-readable`
 * `--archive` (i.e. get everything, and be recursive)
 * `--verbose`
 * `-P` equivalent to `--partial --progress` ...good for a long transfer that may be interrupted
	
And

 * `--stats` tells  rsync to print a verbose set of statistics on the file transfer	

...Can backup multiple files/folders by specifying them with, for example:

	rsync -e ssh root@remote.com:/path/to/file :/path/to/second/file/ /local/directory/

Can use:

	--dry-run  

...to see what will be done, before executing.
	
## Source
 
 * [How to Backup Files in Linux With Rsync on the Command Line](https://www.linux.com/learn/how-backup-files-linux-rsync-command-line)
 * [Stackoverflow: Copying files using rsync from remote server to local machine](https://stackoverflow.com/questions/9090817/copying-files-using-rsync-from-remote-server-to-local-machine)
 
 ## See also
 
 * [Backup multiple remote folders with rsync](backup_multiple_remote_folders_with_rsync.md)