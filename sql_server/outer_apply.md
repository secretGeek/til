# Outer Apply can be very useful

First, assume we have a query that shows us the value of sales and the number of sales in each state....

	Select
		s.State
		Sum(s.Amount) as Amount,
		Count(*) as Number_of_Sales
	from 
		Sales s
	Group by s.State


Now the boss asks you to include the name of the salesperson with the most sales in each state....

You decide to use a subquery in the select. It looks a bit wonky but it gets the job done:

	Select
		s.State,
		Sum(s.Amount) as Amount,
		Count(*) as s.Number_of_Sales,
		BestSalesperson = (Select top(1) Salesperson from Sales where State = s.State group by Salesperson order by Sum(Amount) desc) 
	from 
		Sales s
	Group by s.State


Great -- now the boss asks you to throw in the amount of sales that the lead salesperson had.

You scratch your head and decide to repeat the same subquery you'd already used....


	Select
		s.State,
		Sum(s.Amount) as Amount,
		Count(*) as s.Number_of_Sales,
		BestSalesperson = (Select top(1) Salesperson from Sales where State = s.State group by Salesperson order by Sum(Amount) desc),
	    BestSalesperson_Sales = (Select top(1) Sum(Amount) from Sales where State = s.State group by Salesperson order by Sum(Amount) desc) 
	from 
		Sales s
	Group by s.State

But is there a better way?

Yes there is!

You could've used an OUTER APPLY.... watch

	Select
		s.State,
		Sum(s.Amount) as Amount,
		Count(*) as s.Number_of_Sales,
		so.SalesPerson as BestSalesperson,
	    so.SalesAmount as BestSalesperson_Sales
	from 
		Sales s
	outer apply (Select top (1) 
			Salesperson, 
			Sum(Amount) as SalesAmount 
		from 
			Sales 
		where 
			State = s.State 
		Group by 
			SalesPerson 
		order by 
			Sum(Amount) desc) so
	Group by State, so.SalesPerson, so.SalesAmount

	
Outer apply is just the trick.

It lets you create a table that refers to any other table in the query, without having to perform a regular join.

I suppose there are better examples to be created, but I haven't thought of one just yet.