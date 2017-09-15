# Bulk Comparison with Hashbytes

Imagine we have two tables (or views), `TableNew` and `TableOld`, and we want to know if their data is the same or different.

Assume they have the same schema.

Further assume that their primary key is a composite key with two columns, `PK1` and `PK2`.


	With 
	NEWSET as (
	SELECT 
		MBT.PK1,
		MBT.PK2,
	   hashbytes('MD5',
				   (SELECT MBT.*
					FROM (VALUES(NULL))foo(bar)
					FOR xml auto)) AS [Hash]
	FROM TableNew AS MBT)
	,OLDSET as (
	SELECT 
		MBT.PK1, 
		MBT.PK2,
	   hashbytes('MD5',
				   (SELECT MBT.*
					FROM (VALUES(NULL))foo(bar)
					FOR xml auto)) AS [Hash]
	FROM TableOld AS MBT)
	,Comparison as (
	Select
		n.PK1,
		n.PK2,
		Case 
			when o.[Hash] is null then 'Not in old set'
			when o.[Hash] != n.[Hash] then 'Changed'
			else 'Same'
		end as Summary
	from NewSet n
	left outer join OldSet o on n.PK1 = o.Pk1 and n.PK2 = o.PK2
	)
	,Comparison2 as (
	Select
		o.PK1,
		o.PK2,
		'Not in new set' as Summary
	from OldSet o
	left outer join NewSet n on n.PK1 = o.Pk1 and n.PK2 = o.PK2
	where n.PK1 is null and n.PK2 is null -- i.e. not match
	)
	Select Summary, Count(*)as [Count] from Comparison group by Summary
	UNION
	Select Summary, Count(*)as [Count] from Comparison2 group by Summary

This will give you a summary table that tells you:

* how many are in the old set but not the new (based on primary key) `Not in new set`
* how many are in the new set but not the old (based on primary key) `Not in old set`
* how many are in both sets but with different details in at least one column `Changed`
* how many are in both sets and with identical details in every column `Same`

e.g. 

|Summary|Count|
|-------|-----|
|Changed|607534|
|Not in new set|56|
|Not in old set|7017|
|Same|65449|




## Problem...

The maximum input to `hashbytes` -- prior to SQL 2016 -- is 8000 bytes.

