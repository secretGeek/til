# When was SQL Server restarted?


Mohammad Nizamuddin provides 4 different queries to find when the server was started, the first login occurred, the `tempdbs` were created.


	--SELECT sqlserver_start_time FROM sys.dm_os_sys_info;  --I didn't have permissions for this one
	SELECT login_time FROM sys.dm_exec_sessions WHERE session_id = 1; --this returned nothing for session_id = 1, for me
	SELECT crdate FROM master..sysdatabases WHERE name='tempdb' ;
	SELECT create_date FROM sys.databases WHERE name = 'tempdb' ;
	--select start_time from sys.traces where is_default = 1 ; --I didn't have permissions for this one


## Source

 * [Script to check when was SQL Server restarted](https://gallery.technet.microsoft.com/scriptcenter/Script-to-check-when-was-5d0fe4e8)    