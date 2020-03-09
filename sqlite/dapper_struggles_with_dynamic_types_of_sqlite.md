# Dapper struggles with the ultra dynamic types of sqlite

Using dapper to run this query against sqlite, (and cast it an object with a `Double` type property called "TotalPrice")

	cnn.Query<SalesDetails>(@"
	select 
		p.TotalPrice as TotalPrice
	from 
		Purchases p 
	order by p.ID desc 
	limit 20
	")
	
TotalPrice column has these values:

|TotalPrice|
|----:|
|18.93|
|18.93|
|24|
|18.93|

...it throws an exception with these details:

	? ex.Message
	"Error parsing column 1 (TotalPrice=24 - Int64)"
	? ex.InnerException.Message
	"Unable to cast object of type 'System.Int64' to type 'System.Double'."

What's happening is that row by row the column is coming back with the most appropriate type -- and on row three it's suddenly not a `double` but an `int`.

To overcome it, cast the column to the type you want, *inside* the SQL...

	CAST(p.TotalPrice as DOUBLE) as TotalPrice

...and it's all good.

Still -- a nasty problem, because it may not arise during initial testing... only with the right data does the problem occur!


## References

 * <https://stackoverflow.com/questions/39980840/sqlite-using-dapper-error-parsing-column-unable-to-cast-object-of-type-system>
 
 
