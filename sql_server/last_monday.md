# What date was it on the most recent Monday (.e. last Monday)?


    Select
        DateAdd(day, 1, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Monday,
        DateAdd(day, 15, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Monday_Fortnight,

This works because


    DATEDIFF(wk, 6, GETDATE()),
    
...says "How many weeks between the date of '6' (meaning 7/1/1900)(!!) and now"    

i.e. 6087, currently...

