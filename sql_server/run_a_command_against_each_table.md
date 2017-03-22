# Run a command against each table

While I generally use NimbleText to [run a command against each table](http://nimbletext.com/HowTo/OneQueryManyTables), there are some handy features built into SQL Server that let you do this in a quite seamless manner.

> `sp_msforeachtable`: Runs a command with '?' replaced with each table name (v6.5 and up)

For example:


    exec sp_msforeachtable
        @Command1 = 'print ''reindexing table ?''',
        @Command2 = 'dbcc dbreindex(''?'')',
        @Command3 = 'select count (*), '?' as TableName [?] from ?'

Here's a minimum example to try for yourself:

    exec sp_msforeachtable 'select count (*), '?' as TableName [?] from ?'


You can change the character to use for tablename by supplying a second parameter
    exec sp_MSforeachtable 'print "Should I drop *?"', '*'


Honestly, I wouldn't use this feature at all.

I much prefer the versatility of getting table lists from Information_Schema or even SysObjects, and then turning those results into queries with [NimbleText](http://nimbletext.com/HowTo/OneQueryManyTables).

## Source

 * [NimbleText: How to run the same query against many tables](http://nimbletext.com/HowTo/OneQueryManyTables)
 * [Stack Overflow: Hidden Features of SQL Server](http://stackoverflow.com/questions/121243/hidden-features-of-sql-server)

## See also:

> `sp_msforeachdb`: Runs a command with '?' replaced with each database name (v7 and up)
