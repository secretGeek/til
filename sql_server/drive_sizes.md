# How much space is left on the drives that my sql server can access?

To view how much remaining space you have on the drives your sql server can see, use this command....

	EXEC master..xp_fixeddrives


|drive|MB free|
|-----|-------|
|  C  |  12912|
|  D  |  48222|
|  E  | 201482|


This extended stored procedure seems to be able to be executed even by low privilege accounts.


## See also

 * [Backup restore script](backup_restore_script.md)
 * [Need to delete backup files?](delete_backup_files.md)
 * [How much space does my DB use?](how_much_space_does_my_db_use.md)