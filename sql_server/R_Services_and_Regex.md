# R Services on SQL Server 2016+ (and Regular Expressions)

One way to get regular expression support in SQL Server is to use the language "R". 

R can be used if you have R Services installed. It's available in SQL Server 2016 onward. (And Python services are in SQL Server 2017 onward)

if the services are installed, you also need to configure SQL Server it allow external scripts to be enabled.

## Check if currently enabled:

	EXEC sp_configure  'external scripts enabled'


| name | minimum | maximum | config_value | run_value |
|------|---------|---------|--------------|-----------|
| external scripts enabled | 0 | 1 | 1 | 0 |


The above means that it *is* enabled.

However, because I didn't restart SQL Server after enabling it, it still doesn't work.



## Enable it....

	sp_configure 'external scripts enabled', 1;
	RECONFIGURE WITH OVERRIDE; 


## Test it


	EXEC sp_execute_external_script  @language =N'R',
	@script=N'
	 OutputDataSet <- InputDataSet;
	 ',
	@input_data_1 =N'SELECT 1 AS hello'
	WITH RESULT SETS (([hello] int not null));
	GO

##


## Source

* [External Scripts Enabled server configuration option](https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/external-scripts-enabled-server-configuration-option?view=sql-server-ver15)
* [SQL Server 2016 Regular Expressions with the R Language](https://www.mssqltips.com/sqlservertip/4748/sql-server-2016-regular-expressions-with-the-r-language/)
* [Search Text with Regular Expressions](https://docs.microsoft.com/en-us/sql/ssms/scripting/search-text-with-regular-expressions?view=sql-server-ver15)