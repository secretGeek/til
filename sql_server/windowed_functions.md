# Windowed Functions in SQL Server



* ROW_NUMBER
* RANK
* DENSE_RANK
* NTILE
* SUM
* MAX
* MIN
* AVG
* FIRST_VALUE
* LAST_VALUE
* LEAD
* LAG
* CUME_DIST
* PERCENT_RANK
* PERCENTILE_DISC
* PERCENTILE_CONT


<FUNCTION()> OVER ( 
        [ <PARTITION BY clause> ]
        [ <ORDER BY clause> ] 
        [ <ROW or RANGE clause> ]
       )
	   
<FUNCTION()> -- could be...

	* ROW_NUMBER
	* RANK
	* DENSE_RANK
	* NTILE
	* SUM
	* MAX
	* MIN
	* AVG
	* FIRST_VALUE
	* LAST_VALUE
	* LEAD				-- LEAD(Price, 3)
	* LAG				-- LAG(Price, 3)
	* CUME_DIST
	* PERCENT_RANK
	* PERCENTILE_DISC
	* PERCENTILE_CONT

<PARTITION BY clause> -- could be...

<ORDER BY clause> -- ok -- no tricks there...


<ROW or RANGE clause> -- get a load of thise quirkiness....


	ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING


	
	

You will recognise a windowed function when you see `OVER(` written in a query, e.g.:

	SELECT Customer,
		   Value,
		   SUM(Value) OVER(PARTITION BY Name) AS "Total"
	FROM Sales
	order by 1


> "window functions let you access the detail of the rows from an aggregation"
>
> [Fabiano Amorim](https://www.red-gate.com/simple-talk/sql/learn-sql-server/window-functions-in-sql-server/)


I learn by examples, so here's a lot of examples, inspired by Fabiano Amorim's excellent series of articles:


## ROW_NUMBER()

	Select top 3
		VehicleCode, 
		ROW_NUMBER()  as ROW_NUMBER
	from Reporting.VehiclesCache

	Msg 10753, Level 15, State 3, Line 3
	The function 'ROW_NUMBER' must have an OVER clause.
	
So we add the over clause, in which we specify the ORDER...	
	
	Select top 3
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY VehicleCode) as ROW_NUMBER 
	from Reporting.VehiclesCache


	VehicleCode	ROW_NUMBER
	ABD_MW011	1
	ABD_MW012	2
	ABD_MW013	3

What do you think will happen if we specify the ORDER BY descending...	

Will the row_number got up or down...
	
	Select top 3
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY VehicleCode desc) as ROW_NUMBER 
	from Reporting.VehiclesCache

	VehicleCode	ROW_NUMBER
	YAR_WH001	1
	WYU_WH001	2
	WNC_WH001	3

	
^^ Since there was no sort on the rows themselves, its sorted the outer set by VehicleCode desc, and apply rownumbers starting at 1. That might cause you to re-consider your mental model of how this works.

If we apply an order by to the outer query... we'll see different rows, and different order of row_numbers. (But if we took the `top` clause away we'd be seeing the same data just in a different order.
	
	
	Select top 3
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY VehicleCode desc) as ROW_NUMBER 
	from Reporting.VehiclesCache
	order by VehicleCode asc	
	
	VehicleCode	ROW_NUMBER
	ABD_MW011	8199
	ABD_MW012	8198
	ABD_MW013	8197	
	

Can you use integers for the sorting...

	Select top 3 
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY 1 asc) as ROW_NUMBER
	from Reporting.VehiclesCache
	ORDER BY 1 asc


	Msg 5308, Level 16, State 1, Line 3
	Windowed functions and NEXT VALUE FOR functions do not support integer indices as ORDER BY clause expressions.
	
	
NOPE!


But we can use integers to sort by the ROW_NUMBER column

	Select top 3 
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY VehicleCode asc) as ROW_NUMBER
	from Reporting.VehiclesCache
	order by 2 asc


	VehicleCode	ROW_NUMBER
	ABD_MW011	1
	ABD_MW012	2
	ABD_MW013	3	
	
And can put Windowed functions into the ORDER BY clause explicitly....


	Select top 3 
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY VehicleCode asc) as ROW_NUMBER
	from Reporting.VehiclesCache
	order by ROW_NUMBER() OVER(ORDER BY VehicleCode asc) asc

	VehicleCode	ROW_NUMBER
	ABD_MW011	1
	ABD_MW012	2
	ABD_MW013	3	
	
BUT---- 


	Select top 3 
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY VehicleCode asc) as ROW_NUMBER
	from Reporting.VehiclesCache
	where ROW_NUMBER() OVER(ORDER BY VehicleCode asc) > 4

	Msg 4108, Level 15, State 1, Line 5
	Windowed functions can only appear in the SELECT or ORDER BY clauses.


....can't use a windowed function in the WHERE clause!


(But you can put the thing into a CTE, and then use a where clause against the CTE)

	;with TopVehicles AS
	(Select  
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY VehicleCode asc) as ROW_NUMBER
	from Reporting.VehiclesCache)
	select top 3 
		* 
	from TopVehicles
	where ROW_NUMBER > 4


	WellCode	ROW_NUMBER
	ABD_WH001	5
	ABD_WH002	6
	ABD_WH002R	7
	

And the act of putting it into a CTE and then working on the CTE is a common pattern to get the most out of Windowed Functions.	
	
	
That's just about every beginner thing to do with ROW_NUMBER before getting to PARTITIONS.

Before we introduce the 'Partition' keyword, let's run through the other functions.

## RANK

	Select top 5
		WellCode,
		ExpectedGas_TJ,
		RANK() OVER(ORDER BY ExpectedGas_TJ desc) as RANK_ExpectedGas_TJ
	from Reporting.WellsCache
	where ExpectedGas_TJ is not null and ExpectedGas_TJ < 3.59


	
	WellCode	ExpectedGas_TJ	RANK_ExpectedGas_TJ
	ARG_WH129	3.5	1
	MJN_WH166	3.5	1
	IBL_WH167	3.43525004386902	3
	JMT_WH149	3.40000009536743	4
	MJN_WH174	3.40000009536743	4

	
ROW_NUMBER() is similar to RANK... "Who is first? Who is second? Who is third?"

...Except ROW_NUMBER() *never* admits that people can be tied for first or second etc.

With RANK, if two rows are tied, then they get the same 'RANK'. The next row then skips a number... Like two Olympic Athletes sharing the gold, and the next athelete only gets bronze. Silver is SKIPPED.

"DENSE_RANK" is just a little different. If two atheletes tied for first then the third athelete would get silver, and the fourth athlete would get bronze.


Select top 5
	WellCode,
	ExpectedGas_TJ,
	RANK() OVER(ORDER BY ExpectedGas_TJ desc) as RANK_ExpectedGas_TJ,
    DENSE_RANK() OVER(ORDER BY ExpectedGas_TJ desc) as DENSE_RANK_ExpectedGas_TJ,
	ROW_NUMBER() OVER(ORDER BY ExpectedGas_TJ desc) as ROW_NUMBER_ExpectedGas_TJ
from Reporting.WellsCache
where ExpectedGas_TJ is not null and ExpectedGas_TJ < 3.59


	WellCode	ExpectedGas_TJ	RANK_ExpectedGas_TJ	DENSE_RANK_ExpectedGas_TJ	ROW_NUMBER_ExpectedGas_TJ
	ARG_WH129	3.5	1	1	1
	MJN_WH166	3.5	1	1	2
	IBL_WH167	3.43525004386902	3	2	3
	JMT_WH149	3.40000009536743	4	3	4
	MJN_WH174	3.40000009536743	4	3	5


ROW_NUMBER, RANK, and DENSE_RANK have different guarantees.

If we used them for giving out medals:

* ROW_NUMBER -- only need to make one copy of each medal. Might be unfair in case of a tie.
* RANK -- May not give out *any* silver, or *any* bronze... but "Most fair" (and system that is really used)
* DENSE_RANK -- Will definitely give out *at least* one of each medal... people might get a better medal than they deserve.



Other functions that might seem pretty obvious to use are MAX(), MIN() and AVG().



MAX might look simple here... 

	Select top 5
		WellCode,
		ExpectedGas_TJ,
		MAX(ExpectedGas_TJ) OVER(ORDER BY ExpectedGas_TJ desc) as MAX_TJ
	from Reporting.WellsCache
	where ExpectedGas_TJ is not null and ExpectedGas_TJ < 3.59



	WellCode	ExpectedGas_TJ	MAX_TJ
	ARG_WH129	3.50	3.50
	MJN_WH166	3.50	3.50
	IBL_WH167	3.43	3.50
	JMT_WH149	3.40	3.50
	MJN_WH174	3.40	3.50

...but when you see what MIN(ExpectedGas_TJ) looks like for the same query, you'll start to understand some deeper things that are going on....


	Select top 5
		WellCode,
		ExpectedGas_TJ,
		MAX(ExpectedGas_TJ) OVER(ORDER BY ExpectedGas_TJ desc) as MAX_TJ,
		MIN(ExpectedGas_TJ) OVER(ORDER BY ExpectedGas_TJ desc) as MIN_TJ
	from Reporting.WellsCache
	where ExpectedGas_TJ is not null and ExpectedGas_TJ < 3.59

	
	WellCode	ExpectedGas_TJ	MAX_TJ	MIN_TJ
	ARG_WH129	3.50	3.50	3.5
	MJN_WH166	3.50	3.50	3.5
	IBL_WH167	3.43	3.50	3.43
	JMT_WH149	3.40	3.50	3.40
	MJN_WH174	3.40	3.50	3.40

	
	
	
	
## CTE Pass the Parcel

![CTE Pass the Parcel](cte_pass_the_parcel.png)

## Background reading:

* [Window Functions, Part 1](https://www.red-gate.com/simple-talk/sql/learn-sql-server/window-functions-in-sql-server/)
* [Window Functions, Part 2](https://www.red-gate.com/simple-talk/sql/learn-sql-server/window-functions-in-sql-server-part-2-the-frame/)
* [Window Functions, Part 3](https://www.red-gate.com/simple-talk/sql/learn-sql-server/window-functions-in-sql-server-part-3-questions-of-performance/)

## See also

* [Delete duplicate rows](delete_duplicate_rows.md) (uses `ROW_NUMBER()` and `PARTITION`)