# Split string in SQL Server

Super handy helper function.

Given a delimited string (for example, a comma delimited string), split it into a table, with one row per item.

Used like this:

	Select * from dbo.SplitString('a,b,c,d')

Returns

|Value|
|-----|
|a|
|b|
|c|
|d|


The function:

	CREATE FUNCTION [dbo].[SplitString]
		(
		  @values AS NVARCHAR(MAX) ,
		  @delimiter AS NVARCHAR(20)
		)
	RETURNS @tValues TABLE ( Value NVARCHAR(MAX) )
	AS 
	BEGIN
		IF @values IS NULL
			OR @delimiter IS NULL 
			RETURN

		DECLARE @pattern AS NVARCHAR(22)
		DECLARE @index AS BIGINT

		SET @pattern = '%' + @delimiter + '%'
		
		SET @index = PATINDEX(@pattern, @values)
		WHILE @index > 0 
			BEGIN
				INSERT  INTO @tValues
						( Value 
						)
						SELECT  SUBSTRING(@values, 1, @index - 1) AS [Value]
						
				SET @values = dbo.Substring2(@values,
											 @index + dbo.Len2(@delimiter))
				SET @index = PATINDEX(@pattern, @values)
			END
		
		INSERT  INTO @tValues
				( Value )
		VALUES  ( @values )
		RETURN
	END

	
This CTE version is faster.... (though it doesn't allow you to specify a delimiter)


	CREATE FUNCTION [dbo].[SplitList](@list  nvarchar(MAX)) RETURNS TABLE AS
	RETURN
		WITH csvtbl(start, stop) AS
		(
			SELECT start = convert(bigint, 1),
				stop = charindex(',', @list + ',')
			UNION ALL
			SELECT start = stop + 1,
				stop = charindex(',', @list + ',', stop + 1)
			FROM   csvtbl
			WHERE  stop > 0
		)
		SELECT substring(@list, start,
						CASE WHEN stop > 0 THEN stop - start ELSE 0 END)
				AS Value
		FROM   csvtbl
		WHERE  stop > 0


This one,

1. Does allow you to specify a delimiter, and
2. Tells you where in the source string each element starts and stops
3. Numbers each element


	CREATE FUNCTION [dbo].[SplitListChar](@list  nvarchar(MAX), @delim nchar) RETURNS TABLE AS
	RETURN
		WITH csvtbl(start, stop, rownum) AS
		(
			SELECT start = convert(bigint, 1),
				stop = charindex(@delim, @list + @delim),
				rownum = convert(bigint, 0)
			UNION ALL
			SELECT start = stop + 1,
				stop = charindex(@delim, @list + @delim, stop + 1),
				rownum = rownum + 1
			FROM   csvtbl
			WHERE  stop > 0
		)
		SELECT substring(@list, start,
						CASE WHEN stop > 0 THEN stop - start ELSE 0 END)
				AS Value, stop, start, rownum
		FROM   csvtbl
		WHERE  stop > 0

