# How much space does my DB use?

These two commands give you some nice summary info about your database:

	sp_helpdb MY_DATABASE_NAME
	go
	sp_spaceused


(...including the names of the .mdf and .ldf files which you'll use for the [Backup restore script](backup_restore_script.md))

To see available space use:

	EXEC master..xp_fixeddrives


## Source

 * [Different ways to determine free space for SQL Server databases and database files](https://www.mssqltips.com/sqlservertip/1805/different-ways-to-determine-free-space-for-sql-server-databases-and-database-files/)
 
## See also

 * [Backup restore script](backup_restore_script.md)
 * [Need to delete backup files?](delete_backup_files.md)
 * [How much space is left on the drives that my sql server can access?](drive_sizes.md)
