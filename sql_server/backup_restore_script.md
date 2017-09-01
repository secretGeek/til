# Backup restore script

If you need to move db's around via script, this is me trusty old script since 2000...

    (on source server...)
    BACKUP DATABASE Northwind
      TO DISK = 'c:\Northwind.bak'

    (target server...)
    RESTORE FILELISTONLY
      FROM DISK = 'c:\Northwind.bak'

    (look at the device names... and determine where you want the mdf and
    ldf files to go on this target server)

    RESTORE DATABASE TestDB
      FROM DISK = 'c:\Northwind.bak'
      WITH MOVE 'Northwind' TO 'c:\test\testdb.mdf',
      MOVE 'Northwind_log' TO 'c:\test\testdb.ldf'
    GO


To get the mdf/ldf file names you can also use: `sp_helpdb Northwin`
    
    
## Source

 * http://stackoverflow.com/questions/79669/how-best-to-copy-entire-databases-in-ms-sql-server/79691#79691
 
## See also

 * [Need to delete backup files?](delete_backup_files.md)
 * [How much space is left on the drives that my sql server can access?](drive_sizes.md)
 * [How much space does my DB use?](how_much_space_does_my_db_use.md) 