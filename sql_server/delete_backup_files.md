# Need to delete backup files?

I did -- i had some adhoc .bak files taking up many gig. I remoted onto the server to delete them but I lacked the permission to perform the delete.

For one horrible moment I thought I might need to contact the IT department.

Foruntately I found out about `xp_delete_file` just in time.

This procedure only deletes certain types of files. You tell it which folder to look in, which file extension to look for, and the maximum age of the file (so it won't accidentally delete new files or non back up files.

	EXEC master.sys.xp_delete_file 0,'E:\Temp\','BAK','2017-08-15',0

The five parameters are:

1. `File Type`: **0 for backup files(( or 1 for report files.
2. `Folder Path`: The folder to delete files. The path must end with a backslash "\".
3. `File Extension`: This could be 'BAK' or 'TRN' or an empty string ('') if the files have no extension, etc.
4. `Date`: The maximum date for files to be deleted.
5. `Subfolder`: **0 to ignore subfolders**, 1 to recursively delete files in subfolders.

To see available space use:

	EXEC master..xp_fixeddrives

## Reference

 * [Stackoverflow: SQL Server xp_delete_file parameters](https://stackoverflow.com/questions/24582996/sql-server-xp-delete-file-parameters))

## See also

 * [Backup restore script](backup_restore_script.md)
 * [How much space is left on the drives that my sql server can access?](drive_sizes.md)
 * [How much space does my DB use?](how_much_space_does_my_db_use.md)