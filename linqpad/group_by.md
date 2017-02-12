# Group by...

By far the most common query I've every run in SQL Server is:

    Select SomeColumn, Count(*) as [Count]
    from SomeTable
    group by SomeColumn
    order by 2 desc


Here's the equivalent in Linq:

	var tableSummary = someTable.GroupBy(p=> p.SomeColumn).Select(group => new { 
                             Count = group.Count(), 
							 SomeColumn = group.Key
                        }).OrderByDescending(x => x.Count);
	tableSummary.Dump();						

