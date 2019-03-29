# Windowed Functions in SQL Server

**Pre-requisite: you are expected to be familiar with SQL, including GROUP BY and Aggregates. There is a CTE.**

## Part 1: Over and Over


We all know that this will fail, and why...

	Select top 3
		VehicleCode, 
		COUNT(*) as [COUNT]
	from Reporting.Vehicles


> **Error** Column 'Reporting.Vehicles.VehicleCode' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.


You can't mix aggregates and non aggregates, unless you use GROUP BY. Or can you!?

Watch what happens when we include an `OVER()` clause...

    Select top 3
           VehicleCode, 
           COUNT(*) OVER() as [COUNT]
    from Reporting.Vehicles

|VehicleCode|COUNT|
|--------|-----|
|ABC_VH011|8214|
|ABC_VH012|8214|
|ABC_VH013|8214|

Often the only place we're familiar with `OVER()` from is with the `ROW_NUMBER()` function. Honestly, most of us treat `ROW_NUMBER()` as a little bit of magic text that we copy and paste from stackoverflow each time we want to use it.

Let's follow the same process, but instead of the count function we'll start with a `ROW_NUMBER()`...


	Select top 3
	       VehicleCode, 
	       ROW_NUMBER() as ROW_NUMBER
	from Reporting.Vehicles

> **Error** The function 'ROW_NUMBER' must have an OVER clause.


Now we're told that `The function 'ROW_NUMBER' must have an OVER clause.`


So let's include an OVER clause...

	Select top 3
	       VehicleCode, 
	       ROW_NUMBER() OVER() as ROW_NUMBER
	from Reporting.Vehicles

> **Error** The function 'ROW_NUMBER' must have an OVER clause with ORDER BY.


Now we're heckled with "The function 'ROW_NUMBER' must have an OVER clause with ORDER BY" and I don't know they didn't say that in the first place?

(And you noticed that the `COUNT` function above did not require an `ORDER BY` clause. That's because ROW_NUMBER and COUNT operate under different rules.)

So we'll add that in...

	Select top 3
		   VehicleCode, 
		   ROW_NUMBER() OVER(order by VehicleCode) as ROW_NUMBER 
	from Reporting.Vehicles

|VehicleCode|ROW_NUMBER|
|--------|-----|
|ABC_VH011|1|
|ABC_VH012|2|
|ABC_VH013|3|


And voila! We have our `ROW_NUMBER`... but let's learn more about what's happening here.

First we need to see exactly what the rules are.

Can you guess what will happen if we order by `DESC` ?


	Select top 3
		   VehicleCode, 
		   ROW_NUMBER() OVER(ORDER BY VehicleCode desc) as ROW_NUMBER 
	from Reporting.Vehicles

Will we now get 3,2,1 ? 

|VehicleCode|ROW_NUMBER|
|--------|-----|
|YAX_VH011|1|
|WYX_VH012|2|
|WNX_VH013|3|


No, we still got 1,2,3 -- but the `top 3` Vehicles we were shown were from the *end* of the list of Vehicles, in descending order.

This takes a little bit of thinking. Since there's no sort order on the outer query, the ordering created by the rest of the query is apparent. And it shows us a little bit about the way in which the ROW_NUMBER was applied. They started applying from the back of the list, i.e. starting at 1.

What if we order the outer query by VehicleCode ascending... will we *now* get 3,2,1 ?

	Select top 3
		   VehicleCode
		   ,ROW_NUMBER() OVER(ORDER BY VehicleCode desc) as ROW_NUMBER 
	from Reporting.Vehicles
	order by VehicleCode asc


|VehicleCode|ROW_NUMBER|
|--------|-----|
|ABC_VH011|8214|
|ABC_VH012|8213|
|ABC_VH013|8212|



Can we order by an integer?

	Select top 3 
		   VehicleCode
		   ,ROW_NUMBER() OVER(ORDER BY 1 asc) as ROW_NUMBER
	from Reporting.Vehicles
	order by 1 asc

> **Error** Windowed functions and NEXT VALUE FOR functions do not support integer indices as ORDER BY clause expressions.



Can we order by a Windowed Function?

	Select top 3 
		   VehicleCode, 
		   ROW_NUMBER() OVER(ORDER BY VehicleCode asc) as ROW_NUMBER
	from Reporting.Vehicles
	order by ROW_NUMBER() OVER(ORDER BY VehicleCode desc) asc

|VehicleCode|ROW_NUMBER|
|--------|-----|
|YAX_VH001|8214|
|WYX_VH001|8213|
|WNX_VH001|8212|


Can we put a windowed function into the OVER clause???

	Select top 3 
		VehicleCode, 
		ROW_NUMBER() OVER(ORDER BY 
			ROW_NUMBER() OVER(ORDER BY VehicleCode desc) asc
			) as ROW_NUMBER
	from Reporting.Vehicles

> **Error** Windowed functions cannot be used in the context of another windowed function or aggregate.


Can we put a windowed function in a WHERE clause?

	Select top 3 
		   VehicleCode, 
		   ROW_NUMBER() OVER(ORDER BY VehicleCode asc) as ROW_NUMBER
	from Reporting.Vehicles
	where ROW_NUMBER() OVER(ORDER BY VehicleCode asc) > 4

> **Error** Windowed functions can only appear in the SELECT or ORDER BY clauses.


At this stage we've learnt all the rules.

We can follow this old skating maxim:


> FIRST: Learn all the rules<br />
> NEXT: Break all the rules



Here's how we **CAN** put a windowed-function into a WHERE clause...

	;with TopVehicles AS
	(Select 
		  VehicleCode, 
		  ROW_NUMBER() OVER(ORDER BY VehicleCode asc) as ROWNUM
	from Reporting.Vehicles)
	select top 3 * from TopVehicles
	where ROWNUM > 4

We use a Common-Table-Expression (CTE) to get one extra level of indirection... now we can filter by our windowed-function.


|VehicleCode|ROWNUM|
|--------|------|
|ABC_VH001|5|
|ABC_VH002|6|
|ABC_VH002R|7|


**In fact this is a handy general technique.**

You can also apply a windowed function column to a windowed function, if you **first wrap it in a CTE**. 

This technique creates a kind of CTE game of Pass-the-Parcel. You may need to wrap up many levels of CTE to get the result you need.

![cte pass the parcel](cte_pass_the_parcel.png)


## PART 2: Other Functions

We've finished exploring `COUNT` and `Row_Number` functions for now.

A quick look at other functions.

I said above that "ROW_NUMBER and COUNT operate under different rules" -- that's because they are different types of functions.

Y'see, with `over()` there are **two types of functions** you can use:

1. ALL of the aggregates (e.g. COUNT, SUM, AVG) which you know from GROUPing
2. "Ranking functions"



### What's an example of a Ranking function?

An obvious example would be the `RANK` function itself, which we'll get to in a moment.

But `ROW_NUMBER` is also a ranking function. It's just a very *unfair* ranking 


	Select top 5
		   VehicleCode,
		   ReliabilityFactor,
		   RANK() OVER(ORDER BY ReliabilityFactor desc) as RANK_ReliabilityFactor,
		   ROW_NUMBER() OVER(ORDER BY ReliabilityFactor desc) as ROW_NUM
	from Reporting.Vehicles
	where ReliabilityFactor is not null and ReliabilityFactor <= 3.50


|VehicleCode|ReliabilityFactor|RANK_ReliabilityFactor|ROW_NUM|
|------|------|------|------|
|ARQ_VH129|3.5|1|1|
|MJQ_VH166|3.5|1|2|
|IBV_VH167|3.43525004386902|3|3|
|JMX_VH149|3.40000009536743|4|4|
|MJQ_VH006|3.40000009536743|4|5|

The different ranking functions each use a different 'strategy' for numbering.

In the plain old `RANK` strategy, if two rows are "tied" then they get the same number. And a subsequent number is skipped.

Rank is like the olympics: two people can share a gold medal, but then no one gets the silver.

A different strategy is `DENSE_RANK`:


	Select top 5
		   VehicleCode,
		   ReliabilityFactor,
		   COUNT(*) over () as [Count],
		   RANK() OVER(ORDER BY ReliabilityFactor desc) as RANK_ReliabilityFactor,
		DENSE_RANK() OVER(ORDER BY ReliabilityFactor desc) as DENSE_RANK_ReliabilityFactor,
		   ROW_NUMBER() OVER(ORDER BY ReliabilityFactor desc) as ROW_NUMBER_ReliabilityFactor
	from Reporting.Vehicles
	where ReliabilityFactor is not null and ReliabilityFactor <= 3.50


|VehicleCode|ReliabilityFactor|Count|RANK_ReliabilityFactor|DENSE_RANK_ReliabilityFactor|ROW_NUMBER_ReliabilityFactor|
|------|------|------|------|------|------|
|ARQ_VH129|3.5|3085|1|1|1|
|MJQ_VH166|3.5|3085|1|1|2|
|IBV_VH167|3.43525004386902|3085|3|2|3|
|JMX_VH149|3.40000009536743|3085|4|3|4|
|MJQ_VH006|3.40000009536743|3085|4|3|5|



With dense rank, if two people tie for first they both get a gold medal. And the next person gets a silver.

This way you know every type of number will be handed out, at least once, even though ties are allowed. 

So it's more fair than 'row number' but has different numeric properties. So it can be useful depending on *how* you want to join it to other things.



## PART 3: Aggregates

The famous `MAX` and `MIN`


	Select top 5
		   VehicleCode,
		   ReliabilityFactor,
		   ROW_NUMBER() OVER(ORDER BY ReliabilityFactor desc) as ROW_NUMBER_ReliabilityFactor,
		   MAX(ReliabilityFactor) OVER() as MAX_RF,
		   MIN(ReliabilityFactor) OVER() as MIN_RF
	from Reporting.Vehicles
	where ReliabilityFactor is not null and ReliabilityFactor <= 3.50


|VehicleCode|ReliabilityFactor|ROW_NUMBER_ReliabilityFactor|MAX_RF|MIN_RF|
|------|------|------|------|------|
|ARQ_VH129|3.5|1|3.5|0|
|MJQ_VH166|3.5|2|3.5|0|
|IBV_VH167|3.43525004386902|3|3.5|0|
|JMX_VH149|3.40000009536743|4|3.5|0|
|MJQ_VH006|3.40000009536743|5|3.5|0|


What if we specify an order by!?


	Select top 5
		VehicleCode,
		ReliabilityFactor,
		ROW_NUMBER() OVER(ORDER BY ReliabilityFactor desc) as ROW_NUMBER_ReliabilityFactor,
		--MAX(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc) as MAX_RF,
		MIN(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc) as MIN_RF
	from Reporting.Vehicles
	where ReliabilityFactor is not null and ReliabilityFactor <= 3.50


|VehicleCode|ReliabilityFactor|ROW_NUMBER_ReliabilityFactor|MIN_RF|
|------|------|------|------|
|ARQ_VH129|3.5|1|3.5|
|MJQ_VH166|3.5|2|3.5|
|IBV_VH167|3.43525004386902|3|3.43525004386902|
|JMX_VH149|3.40000009536743|4|3.40000009536743|
|MJQ_VH006|3.40000009536743|5|3.40000009536743|


## PART 4: RANGES/PRECEDING/FOLLOWING



	Select top 7
		   VehicleCode,
		   ReliabilityFactor,
		   -- A:
		   COUNT(*) OVER() as [COUNT_OVER],
		   -- B:
		   COUNT(*) OVER(ORDER BY ReliabilityFactor desc  ) as [COUNT_ORDER_BY_RF],
		   -- C:
		   COUNT(*) OVER(ORDER BY ReliabilityFactor desc RANGE 
						 UNBOUNDED PRECEDING) as [COUNT_RF_RANGE],
		   -- D:
		   COUNT(*) OVER(ORDER BY ReliabilityFactor desc RANGE 
						 BETWEEN UNBOUNDED PRECEDING
							   AND CURRENT ROW) as [COUNT_RF_RANGE_BETWEEN],
		   -- E:
		   COUNT(*) OVER(ORDER BY ReliabilityFactor desc ROWS 
						 BETWEEN UNBOUNDED PRECEDING
							   AND CURRENT ROW) as [COUNT_RF_ROWS]

	from Reporting.Vehicles
	where ReliabilityFactor is not null and ReliabilityFactor <= 3.50



|VehicleCode|ReliabilityFactor|COUNT_OVER|COUNT_ORDER_BY_RF|COUNT_RF_RANGE|COUNT_RF_RANGE_BETWEEN|COUNT_RF_ROWS|
|------|------|------|------|------|------|------|
|ARQ_VH129|3.5|3085|2|2|2|1|
|MJQ_VH166|3.5|3085|2|2|2|2|
|IBV_VH167|3.43525004386902|3085|3|3|3|3|
|JMX_VH149|3.40000009536743|3085|7|7|7|4|
|MJQ_VH006|3.40000009536743|3085|7|7|7|5|
|MJQ_VH174|3.40000009536743|3085|7|7|7|6|
|MJQ_VH204|3.40000009536743|3085|7|7|7|7|


Here is a fairly exhaustive set of clauses...


	Select top 7
		   VehicleCode,
		   ReliabilityFactor,
		   --A:
		   MIN(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc) as MIN_RF,
		   --B:
				  MIN(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc RANGE 
						 UNBOUNDED PRECEDING) as MIN_RF,
		   --B1:
		   MIN(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc RANGE 
						 BETWEEN UNBOUNDED PRECEDING
							   AND CURRENT ROW) as MIN_RF,
		   --C:
		   MIN(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc  ROWS 
						 BETWEEN UNBOUNDED PRECEDING
							   AND UNBOUNDED FOLLOWING) as MIN_RF_UNBOUNDED,
		   --D:
		   MIN(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc  RANGE 
						 BETWEEN UNBOUNDED PRECEDING
							   AND UNBOUNDED FOLLOWING) as MIN_RF_RANGE_UNBOUNDED,
		   --E:
		   MIN(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc  RANGE 
						 UNBOUNDED PRECEDING) as MIN_RF_RANGE_UNBOUNDED_PREC,
		   --F:
		   Max(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc
		   rows BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) as Max_RF_rows_AHEAD,
		   --G:
		   Max(ReliabilityFactor) OVER(ORDER BY ReliabilityFactor desc
		   rows BETWEEN 2 PRECEDING AND 2 FOLLOWING) as Max_RF_rows_neighbours

	from Reporting.Vehicles
	where ReliabilityFactor is not null and ReliabilityFactor <= 3.50
	order by ReliabilityFactor desc


|VehicleCode|ReliabilityFactor|MIN_RF|MIN_RF1|MIN_RF2|MIN_RF_UNBOUNDED|MIN_RF_RANGE_UNBOUNDED|MIN_RF_RANGE_UNBOUNDED_PREC|Max_RF_rows_AHEAD|Max_RF_rows_neighbours|
|------|------|------|------|------|------|------|------|------|------|
|ARQ_VH129|3.5|3.5|3.5|3.5|0|0|3.5|3.5|3.5|
|MJQ_VH166|3.5|3.5|3.5|3.5|0|0|3.5|3.5|3.5|
|IBV_VH167|3.43525004386902|3.43525004386902|3.43525004386902|3.43525004386902|0|0|3.43525004386902|3.43525004386902|3.5|
|JMX_VH149|3.40000009536743|3.40000009536743|3.40000009536743|3.40000009536743|0|0|3.40000009536743|3.40000009536743|3.5|
|MJQ_VH006|3.40000009536743|3.40000009536743|3.40000009536743|3.40000009536743|0|0|3.40000009536743|3.40000009536743|3.43525004386902|
|MJQ_VH174|3.40000009536743|3.40000009536743|3.40000009536743|3.40000009536743|0|0|3.40000009536743|3.40000009536743|3.40000009536743|
|MJQ_VH204|3.40000009536743|3.40000009536743|3.40000009536743|3.40000009536743|0|0|3.40000009536743|3.40000009536743|3.40000009536743|


## PART 5: PARTITIONS

We will use `COUNT` to demonstrate partitions.

First, a `COUNT` with no partition...

The `COUNT` is the total count...

	Select top 9
		   VehicleCode, 
		   Fleet,
		   COUNT(*) OVER() as [COUNT]
	from Reporting.Vehicles
	where not Fleet is null
	order by Fleet, Vehiclecode

|VehicleCode|Fleet|COUNT|
|------|------|------|
|PLF_VH112|096FQ389|8191|
|CHP_VH151|0H3A82P2|8191|
|CHP_VH159|0H3A82P2|8191|
|PEF_VH007|0C1FT1H2|8191|
|BXR_VH188|1Y0PY47X|8191|
|BXR_VH190|1Y0PY47X|8191|
|BXR_VH199|1Y0PY47X|8191|
|BXR_VH200|1Y0PY47X|8191|
|BXR_VH201|1Y0PY47X|8191|




Let's add some partition... This time count will show us how many rows in each Fleet:

	Select top 9
		   VehicleCode, 
		   Fleet,
		   ROW_NUMBER() OVER(PARTITION BY Fleet order by VehicleCode) as [ROW_IN_Fleet],
		   COUNT(*) OVER(PARTITION BY Fleet) as [COUNT_IN_Fleet],
		   -- Friendly Name...
		   'Vehicle ' + Cast(ROW_NUMBER() OVER(PARTITION BY Fleet order by VehicleCode) as Varchar(10))  + ' of ' + Cast(COUNT(*) OVER(PARTITION BY Fleet) as Varchar(10)) + ' on ' + Fleet as [Friendly_Name]
	from Reporting.Vehicles
	where not Fleet is null
	order by Fleet, Vehiclecode

|VehicleCode|Fleet|ROW_IN_Fleet|COUNT_IN_Fleet|Friendly_Name|
|------|------|------|
|PLF_VH112|096FQ389|1|1|Vehicle 1 of 1 on 096FQ389|
|CHP_VH151|0H3A82P2|1|2|Vehicle 1 of 2 on 0H3A82P2|
|CHP_VH159|0H3A82P2|2|2|Vehicle 2 of 2 on 0H3A82P2|
|PEF_VH007|0C1FT1H2|1|1|Vehicle 1 of 1 on 0C1FT1H2|
|BXR_VH188|1Y0PY47X|1|5|Vehicle 1 of 5 on 1Y0PY47X|
|BXR_VH190|1Y0PY47X|2|5|Vehicle 2 of 5 on 1Y0PY47X|
|BXR_VH199|1Y0PY47X|3|5|Vehicle 3 of 5 on 1Y0PY47X|
|BXR_VH200|1Y0PY47X|4|5|Vehicle 4 of 5 on 1Y0PY47X|
|BXR_VH201|1Y0PY47X|5|5|Vehicle 5 of 5 on 1Y0PY47X|


## PART 6: LEAD/LAG


	Select top 9
		   VehicleCode, 
		   COUNT(*) OVER(PARTITION BY Fleet) as [COUNT_IN_Fleet],
		   Fleet,
		   LEAD(Fleet) OVER(order by Fleet, VehicleCode) as [NEXT_Fleet],
		   LAG(Fleet) OVER(order by Fleet, VehicleCode) as [PREVIOUS_Fleet],
		   LEAD(Fleet,2) OVER(order by Fleet, VehicleCode) as [NEXT_NEXT_Fleet],
		   LAG(Fleet,2) OVER(order by Fleet, VehicleCode) as [PREVIOUS_PREVIOUS_Fleet],
		   LEAD(Fleet,8172) OVER(order by Fleet, VehicleCode) as [NEXT_Fleet_8172],
		   FIRST_VALUE(VehicleCode) OVER(partition by Fleet order by Vehiclecode) as First_Vehicle_in_Fleet,
		   LAST_VALUE(VehicleCode) OVER(partition by Fleet order by Vehiclecode 
			   RANGE BETWEEN 
			   CURRENT ROW AND UNBOUNDED FOLLOWING) as Last_Vehicle_in_Fleet
	from Reporting.Vehicles
	where not Fleet is null
	order by Fleet, Vehiclecode


|VehicleCode|COUNT_IN_Fleet|Fleet|NEXT_Fleet|PREVIOUS_Fleet|NEXT_NEXT_Fleet|PREVIOUS_PREVIOUS_Fleet|NEXT_Fleet_8172|First_Vehicle_in_Fleet|Last_Vehicle_in_Fleet|
|------|------|------|------|------|------|------|------|------|------|
|PLF_VH112|1|096FQ389|0H3A82P2||0H3A82P2||APYX07|PLF_VH112|PLF_VH112|
|CHP_VH151|2|0H3A82P2|0H3A82P2|096FQ389|0C1FT1H2||APYX07|CHP_VH151|CHP_VH159|
|CHP_VH159|2|0H3A82P2|0C1FT1H2|0H3A82P2|1Y0PY47X|096FQ389|APYX07|CHP_VH151|CHP_VH159|
|PEF_VH007|1|0C1FT1H2|1Y0PY47X|0H3A82P2|1Y0PY47X|0H3A82P2|APYX07|PEF_VH007|PEF_VH007|
|BXR_VH188|5|1Y0PY47X|1Y0PY47X|0C1FT1H2|1Y0PY47X|0H3A82P2|APYX07|BXR_VH188|BXR_VH201|
|BXR_VH190|5|1Y0PY47X|1Y0PY47X|1Y0PY47X|1Y0PY47X|0C1FT1H2|APYX07|BXR_VH188|BXR_VH201|
|BXR_VH199|5|1Y0PY47X|1Y0PY47X|1Y0PY47X|1Y0PY47X|1Y0PY47X|APYX07|BXR_VH188|BXR_VH201|
|BXR_VH200|5|1Y0PY47X|1Y0PY47X|1Y0PY47X|101DY473|1Y0PY47X|ARG447|BXR_VH188|BXR_VH201|
|BXR_VH201|5|1Y0PY47X|101DY473|1Y0PY47X|101DY473|1Y0PY47X|ARG447|BXR_VH188|BXR_VH201|



## Background reading:

* [Window Functions, Part 1](https://www.red-gate.com/simple-talk/sql/learn-sql-server/window-functions-in-sql-server/)
* [Window Functions, Part 2](https://www.red-gate.com/simple-talk/sql/learn-sql-server/window-functions-in-sql-server-part-2-the-frame/)
* [Window Functions, Part 3](https://www.red-gate.com/simple-talk/sql/learn-sql-server/window-functions-in-sql-server-part-3-questions-of-performance/)


## See also

* [Delete duplicate rows](delete_duplicate_rows.md) (uses `ROW_NUMBER()` and `PARTITION`)