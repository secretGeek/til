# Convert a timestamp column to a varchar

To cast or convert a timestamp column to a varchar column... 2 different ways

	SELECT 
		MyTimeStamp, 
		Replace(Upper(master.sys.fn_varbintohexstr(MyTimeStamp)),'0X','0x') as MyTimeStampToo,
		CONVERT(NVARCHAR(MAX), CONVERT(BINARY(8), MyTimeStamp), 1) as MyTimeStampAlso,
		CONVERT(NVARCHAR(MAX), CONVERT(BINARY(8), MyTimeStamp), 2) as MyTimeStampMINUS_0x
	from MyTable
	
Returns, for example:

|MyTimeStamp|MyTimeStampToo|MyTimeStampAlso|MyTimeStampMINUS_0x|
|-------|-----|--------------|--------|
|0x000000000064B166 |0x000000000064B166|0x000000000064B166|000000000064B166|


Notes:

 * fn_varbintohexstr is an undocumented function best avoided
 * In the convert examples, changing the `1` to `2` omits the `0x`.
	

## Sources

 * [SO: How to convert TIMESTAMP values to VARCHAR in T-SQL as SSMS does?](https://stackoverflow.com/questions/41014533/how-to-convert-timestamp-values-to-varchar-in-t-sql-as-ssms-does)