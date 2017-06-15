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
