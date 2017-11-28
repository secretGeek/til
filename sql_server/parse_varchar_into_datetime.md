# Parse varchar into DateTime

Turning arbitrary varchars into Dates is awkward in SQL-Server

In my case the column called 'Date' was a varchar, and it was formatted in 4 different ways.

(Luckily there was no ambiguity, like you'd get if there was a mix of dd/MM/yyyy and MM/dd/yyyy )

So -- step 1 -- I built a case statement that used 'patindex' to determine which pattern the varchar conformed to.

	Select
		[Date],
		case 
			when Patindex('[0-9][0-9]-[A-Z][a-z][a-z]-[0-9][0-9][0-9][0-9]', [Date]) = 1 then 
				'dd-MMM-yyyy'
			when Patindex('[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9]', [Date]) = 1 then 
				'yyyy-MM-dd HH:mm:ss'
			when Patindex('[0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9]', [Date]) = 1 then 
				'yyyy/MM/dd'
			when Patindex('[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]', [Date]) = 1 then 
				'MM/dd/yyyy'
			when isnull([Date],'') = '' then 
				'(blank)'
			else 
				'unknown' 
		end as DateValue
	from YUCKY_SOURCE_DATA
	order by 2, 1

Once I was sure I was capturing every type of format, then -- step 2 -- I applied Convert with a specific number suited to the format.

The classic help page on this is https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql -- it's a horrible page and I groan whenever I have to use it.

	Select
		[Date],
		case 
			when Patindex('[0-9][0-9]-[A-Z][a-z][a-z]-[0-9][0-9][0-9][0-9]', [Date]) = 1 then 
				--'dd-MMM-yyyy'
				Convert(datetime, [date], 106)
			when Patindex('[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9]', [Date]) = 1 then 
				--'yyyy-MM-dd HH:mm:ss'
				Convert(datetime, [date], 120)
			when Patindex('[0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9]', [Date]) = 1 then 
				--'yyyy/MM/dd'
				Convert(datetime, [date], 111)
			when Patindex('[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]', [Date]) = 1 then 
				--'MM/dd/yyyy'
				Convert(datetime, [date], 101)
			when isnull([Date],'') = '' then 
				--'(blank)'
				NULL
			else 
				--'unknown' 
				NULL
		end as DateValue
	from YUCKY_SOURCE_DATA
	order by 2, 1


## See also

* [Format DateTime as yyyy-MM-dd](format_datetime_yyyy-MM-dd.md)