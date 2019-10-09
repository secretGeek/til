# Search all views functions or sprocs for a piece of text

This is my most used snippet in "[kv](http://www.secretgeek.net/kv)" (key value snippet storer). "kv sysc"

    Select distinct 'sp_helptext ''' + Schema_Name(UID) + '.' + so.Name + '''
    go' from sysobjects so inner join syscomments sc on so.id = sc.id where sc.text like
    '%%'

Similarly, here's a query to find objects by name (so) &mdash;

    Select Schema_Name(UID) + '.' + Name , Xtype
    from sysobjects
    where
    xtype = 'U' AND Schema_Name(UID) + '.' + Name like
    '%%'


And one to find columns (sc) &mdash;

    Select sc.Name as [Column], Schema_Name(so.UID) + '.' + so.Name as [Table], so.Xtype
    from sysobjects so
    inner join syscolumns sc on so.id = sc.id
    where so.xtype in ('U','V') AND Schema_Name(so.UID) + '.' + so.Name  like
    '%%'
    --and sc.Name like '%%'

And here's commands to add them to `kv` &mdash;

	kv sysc "Select distinct 'sp_helptext ''' + Schema_Name(UID) + '.' + so.Name + '''
	go' from sysobjects so inner join syscomments sc on so.id = sc.id where sc.text like
	'%%'"


	kv so "Select Schema_Name(UID) + '.' + Name , Xtype
	from sysobjects
	where
	xtype in ('U','V','P') AND Schema_Name(UID) + '.' + Name like
	'%%'"


	kv sc "Select sc.Name as [Column], Schema_Name(so.UID) + '.' + so.Name as [Table], so.Xtype
	from sysobjects so
	inner join syscolumns sc on so.id = sc.id
	where
	--so.xtype in ('U','V') AND Schema_Name(so.UID) + '.' + so.Name like '%%'
	--and
	--sc.Name like '%%'"

Here's a command to list all objects that have definitions, along with their definition:

	Select
		schema_name(so.uid) + '.' + so.[name]  AS [Schema.Object],
		so.xtype,
		Definitions.Definition,
		len(Definitions.Definition) as [Length of definition],
		master.dbo.fn_varbintohexstr(hashbytes('MD5', Definitions.Definition)) as Hasho
	from
	sysobjects so
	outer apply (Select stuff((select '' + sc.text
						from syscomments  sc
					where sc.id = so.id
					order by colid
					for xml path , TYPE).value('.[1]','nvarchar(max)'
				), 1, 1, '') as Definition) as Definitions
	where Definitions.Definition is not null




Notice I've combined it with hashbytes for easy difference checking/comparison of objects.