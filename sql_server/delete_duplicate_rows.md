# Delete duplicate rows


It can be hard to delete true duplicate rows.

First, this only happens with adhoc tables that have no primary key and no uniqueness constraints. But such tables do exist at times... and it can be the devil to correct it.

How do you construct a query that will delete one of the duplicates and not the other?


If you try to delete the rows by right-clicking on the table and choosing "Edit top 200 rows" ... it will look like it's about to work:

	Click Yes to permanently delete these rows. You won't be able to undo those changes.

But will fail with this message:

	No rows were deleted.

	A problem occurred attempting to delete row 101.
	Error Source: Microsoft.SqlServer.Management.DataTools.
	Error Message: The row value(s) updated or deleted either do not make the row unique or they alter multiple rows(2 rows).

	Correct the errors and attempt to delete the row again or press ESC to cancel the change(s).



Here's the trick...

Write a select row_number() over partition that shows the repetition: (you'll need to adjust the `partition by` clause)
	
	WITH cte
		 AS (SELECT Category, Unit, FullPath, [Date], ROW_NUMBER() OVER (PARTITION BY Category, Unit, FullPath, [Date]
										   ORDER BY ( SELECT 0)) RN
			 FROM   QAPortal.TechMetric
			 where category = 'SSRS' and Unit = 'Reports' )
	SELECT * FROM CTE
	--DELETE FROM cte
	WHERE  RN > 1;         
	
	
Once you're looking at just the right rows to obliterate, 

Comment out the 'SELECT * FROM CTE' and uncomment the `DELETE FROM CTE`

Boya!

	
	(8 row(s) affected)


## Source

 * [stack overflow: how can i remove duplicate rows](https://stackoverflow.com/questions/18932/how-can-i-remove-duplicate-rows)
 
 
## See also

 * [Window Functions in SQL Server](window_functions.md) 