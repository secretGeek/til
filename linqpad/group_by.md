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

Here's a more complex example:

    var data = new Person[] { 
        new Person { Name = "Jim", Height = 1000}, 
        new Person { Name = "Jack", Height = 2000},
        new Person { Name = "Jack", Height = 2300},
        new Person { Name = "Jim", Height = 5000},
        new Person { Name = "Jim", Height = 12}
    };
    var groups = data.GroupBy(p => p.Name, (key, values)
        => new { 
            Name = key, 
            Count = values.Count(), 
            Avg_Height = values.Average(a => a.Height), 
            Total_Height = values.Sum(a => a.Height),
            Name_Length = values.Average(a => a.Name.Length),
            Name_Length2 = key.Length,
            Max_Height = values.Max(a => a.Height),
            Min_Height = values.Min(a => a.Height),
            Variance_Height = values.Max(a => a.Height) - values.Min(a => a.Height),
            Members = values}
            ).Where(g => g.Count > 1).OrderByDescending(gg => gg.Variance_Height);
    groups.Dump();