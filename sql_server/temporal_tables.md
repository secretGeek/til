# Temporal Table feature in SQL Server

Introduced in SQL Server 2016. Improved in SQL Server 2017.


**History tables**  Traditionally these are manually implemented....

e.g. when updating a row, you insert the old row into a history table you've invented, following your own frail local standard technique.

Problems with manually implemented:

- Semantics are hard to work out because it can be inconsistent each time.
- a bulk update to a manually implemented one will fail to update the history. (e.g. you want all inserts to go through a special sproc... well there's no way to enforce that, and it doesn't allow bulk updates either)
- no enforcement of consistency -- are all time ranges covered? is a given time covered twice? etc.
- how do you handle deletes?

If you use the temporal table feature in sql server, all of that will be handled for you -- a history table created for you, in a consistent manner.

	,	[sysStart]	datetime2(7)	generated always as row start hidden not null
	,	[sysEnd]	datetime2(7)	generated always as row end  hidden not null
	,	period for system_time ([sysStart],[sysEnd])


Note the generated `datetime2` columns are always `UTC`. This can be annoying for users. To get around that, one solution is you could add:

	[UpdatedDate] as dateadd(hour, 10, [sysStart])
	
...this adds a calculated column equivalent to Brisbane time... (we don't have daylight savings so it works for us.)

In SSMS, object explorer, table list, there is a "(System-Versioned)" text next to temporal tables. You expand that table to see the history table "under it". It's wild.

Adding a column is tricky -- because you want it to be inserted as null into the history tables.




## Bulk loading... 

before:

	alter table ... set (system_versioning = off)
	alter table ... drop period for system time
	go

...then perform the bulk...


after:

	alter table ... add period for system_time ([sysStart],[sysEnd]);
	alter table ... add period for system_time set (system_versioning - on (history_table = ... history table name... ;
	go
	alter table ... alter column [SysStart] add hidden;
	alter table ... alter column [SysEnd] add hidden;
	go


