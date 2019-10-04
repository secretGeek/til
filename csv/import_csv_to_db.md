# Import CSV file to a Database, quickly


> Challenge: you have a csv file and you need to import it into a new table in a database. You have 5 mins to get it done. What tools do you use?
>
> [Twitter](https://twitter.com/secretGeek/status/1179515031190306817)



## Multiple Database Platforms (and any OS)

- Python - Pandas

    import pandas
    from sqlalchemy import create_engine
    engine = create_engine('connection string')
    df = pandas.read_csv("path/to.csv")
    df.to_sql("table_name", engine)



- "R"

Via [Scott Stanfield:](https://twitter.com/seesharp/status/1179569651119874048?s=20)

> Load in R with data.table fread() method. It'll impute the data types...gets you 80% of the way there. 

![R data.table fread()](R_datatable_fread.jpg)


- [Generate SQL Insert Statements with NimbleText (web version)](https://nimbletext.com/HowTo/GenerateInsert)


- Sublime (editor), use Multiple line edit to turn the data into SQL

- (Any editor), use search/replace (perhaps with regular expressions) to turn the data into SQL

- (Any spreadsheet), write formulae that combine the data together to turn the data into SQL



## Multiple Database Platforms (but Windows only)


- LinqPad [CSV to IEnumerable (or Array) in Linqpad](/linqpad/csv_to_array.md)


- Microsoft Log Parser
	Logparser -o sql -server 127.0.0.1 -database -createtable on "select * into newtable from blah" user... pass

- [Alteryx](https://www.alteryx.com)

  - drag in an `Input data` -- point it at the csv.
  - (optional) drag in a `Select` - use it to configure the column types
  - drag in an `Output data` -- point it at the database (and set the table name)
  - Run!


- [Generate SQL Insert Statements with NimbleText (downloaded version)](https://nimbletext.com/HowTo/GenerateInsert)
   The Windows version is better if you want to use a "real" CSV parser that can handle embedded delimiters and line breaks. Just switch on the 'use qualifier' option under tools | options.


# Multiple Database Platforms (but MacOS Only)

(No examples available)


# MS SQL Server

* Sql Server Management Studio (SSMS) -- right click on Database, Tasks, "Import Flat File..."

* BCP (Bulk Copy Program)

* TSQL: [BULK INSERT](https://docs.microsoft.com/en-us/sql/relational-databases/import-export/import-bulk-data-by-using-bulk-insert-or-openrowset-bulk-sql-server?view=sql-server-2017)

		BULK INSERT Sales.Orders
		FROM '\\SystemX\DiskZ\Sales\data\orders.csv'
		WITH ( FIRSTROW = 2, FORMAT='CSV');



* [Four Easy Ways to Import CSV Files to SQL Server with PowerShell](https://devblogs.microsoft.com/scripting/four-easy-ways-to-import-csv-files-to-sql-server-with-powershell/)

* [SQL Down under tools](https://sqldownunder.com/pages/sdu-tools) -- see [ReadCSV demo movie](https://www.youtube.com/watch?v=ypuHanV2c6E&feature=youtu.be)




## SQLite

- [Tutorial: Import a CSV File Into an SQLite Table](https://www.sqlitetutorial.net/sqlite-import-csv/)

If there are no header names in the csv, then find the header names and run:

	"create table mytable (header_a, header_b, header_c)"; 

Next step (do this whether you needed the previous step or not)

	.mode csv
	.import data.csv mytable

## MySQL


- [Load Data Infile](http://www.mysqltutorial.org/import-csv-file-mysql-table/)

		LOAD DATA INFILE 'c:/tmp/discounts.csv' 
		INTO TABLE discounts 
		FIELDS TERMINATED BY ',' 
		ENCLOSED BY '"'
		LINES TERMINATED BY '\n'
		IGNORE 1 ROWS;

- PhpMyAdmin

## Postgresql

Two techniques: `Copy` command in sql itself, and `\copy` command in `psql` (interactive commandline).


 - [Sql-copy](https://www.postgresql.org/docs/current/sql-copy.html) - requires root access

    COPY dog_habits FROM '/home/user521/pets/dog_habits.csv' DELIMITER ',' CSV HEADER;


 - [psql \copy](https://www.postgresql.org/docs/current/app-psql.html) - use interactive psql commandline where file permissions are an issue 

        psql -c "\copy sample FROM '/home/user521/pets/dog_habits.csv' WITH (FORMAT CSV)"


## Oracle

- [Oracle APEX](https://apex.oracle.com/en/)

   > "a couple of clicks and we're done"
   >
   > [@APEX/JeffreyKemp.sql](https://twitter.com/jeffreykemp/status/1179990364259663872)


## Hadoop

- [@BenBrandwood](https://twitter.com/ben_brandwood/status/1179689026930036736) gives this Hadoop example...

		hive> CREATE EXTERNAL TABLE IF NOT EXISTS test_ext
		> (ID int,
		> DEPT int,
		> NAME string
		> )
		> ROW FORMAT DELIMITED
		> FIELDS TERMINATED BY ','
		> STORED AS TEXTFILE
		> LOCATION '/test';
		OK
		Time taken: 0.395 seconds


## Alternative: Just treat the CSV as SQL

- [TextQL](http://dinedal.github.io/textql/) - Execute SQL against CSV or TSV.
- [q](https://harelba.github.io/q/) - Run SQL Directly on CSV Files
- [RBQL](https://rbql.org) - Rainbow Query Language, a SQL-like language with JavaScript or Python backend.
