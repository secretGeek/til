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
    where so.xtype in ('U','V') AND Schema_Name(so.UID) + '.' + so.Name like
    '%%'
    --and sc.Name like '%%'"
