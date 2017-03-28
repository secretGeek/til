# Search all views functions or sprocs for a piece of text

This is my most used snippet in "[kv](http://www.secretgeek.net/kv)" (key value snippet storer). "kv sysc"

    select distinct schema_name(so.uid) + '.' + so.name from syscomments sc inner join sysobjects so on sc.id = so.id where sc.text like 
    '%%'
	
Similarly, here's a query for objects by name:

    Select Schema_Name(UID) + '.' + Name , Xtype
	from sysobjects
	where
	xtype = 'U' AND Schema_Name(UID) + '.' + Name like 
	'%%'


And one for columns:

	Select sc.Name as Column, Schema_Name(so.UID) + '.' + so.Name as Table, so.Xtype
	from sysobjects so
	inner join syscolumns sc on so.id = sc.id
	where so.xtype in ('U','V') AND Schema_Name(so.UID) + '.' + so.Name  like 
	'%%'
	--and sc.Name like '%%'


And here's commands to add them to kv:


    kv sysc "select distinct schema_name(so.uid) + '.' + so.name from syscomments sc inner join sysobjects so on sc.id = so.id where sc.text like 
    '%%'"
	
    kv so "Select Schema_Name(UID) + '.' + Name , Xtype
	from sysobjects
	where
	xtype = 'U' AND Schema_Name(UID) + '.' + Name  like 
	'%%'"
	
	kv sc "Select sc.Name as Column, Schema_Name(so.UID) + '.' + so.Name as Table, so.Xtype
	from sysobjects so
	inner join syscolumns sc on so.id = sc.id
	where so.xtype in ('U','V') AND Schema_Name(so.UID) + '.' + so.Name  like 
	'%%'
	--and sc.Name like '%%'"	
