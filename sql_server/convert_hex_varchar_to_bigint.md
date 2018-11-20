# How do I Convert a Hex varchar to a Bigint in SQL Server? (solved)



Given a string such as 

> 0x00000000007240EE

How do I turn it into an integer? (a bigint in fact)?

Answer:


	select convert(bigint, convert (varbinary(8), '0x00000000007240EE', 1))
	
Result:

	7487726

