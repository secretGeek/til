# What date was it on the most recent  monday?


    Select
        DateAdd(day, 1, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Monday,
        DateAdd(day, 15, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Monday_Fortnight,

