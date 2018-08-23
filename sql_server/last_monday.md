# What date was it on the most recent Monday (i.e. last Monday)?

...and so on....

	Select
		DateAdd(day, 1, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Monday,
		DateAdd(day, 1+7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Next_Monday,
		DateAdd(day, 1+14, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Monday_Fortnight,
		DateAdd(day, 2, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Tuesday,
		DateAdd(day, 3, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Wednesday,
		DateAdd(day, 4, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Thursday,
		DateAdd(day, 5, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Friday,
		DateAdd(day, 6, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Saturday,
		DateAdd(day, 7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Most_Recent_Sunday,
		DateAdd(day, 2+7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Next_Tuesday,
		DateAdd(day, 3+7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Next_Wednesday,
		DateAdd(day, 4+7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Next_Thursday,
		DateAdd(day, 5+7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Next_Friday,
		DateAdd(day, 6+7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Next_Saturday,
		DateAdd(day, 7+7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6)) as Next_Sunday
    
This works because


    DATEDIFF(wk, 6, GETDATE()),
    
...says "How many weeks between the date of '6' (meaning 7/1/1900)(!!) and now"    

i.e. currently about 6087



...and I'll `C` `U` `DateAdd(day, 2+7, DATEADD(wk, DATEDIFF(wk, 6, GETDATE()), 6))`

