# How much space does my DB use?

These two commands give you some nice summary info about your database:

	sp_helpdb MY_DATABASE_NAME
	go
	sp_spaceused


(..including the names of the .mdf and .ldf files which you'll use for the [Backup restore script](backup_restore_script.md))

## Source

 * [Different ways to determine free space for SQL Server databases and database files](https://www.mssqltips.com/sqlservertip/1805/different-ways-to-determine-free-space-for-sql-server-databases-and-database-files/)
 
## See also

 * [Backup restore script](backup_restore_script.md)