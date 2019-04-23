# Csv To Html function in SQL

This is a somewhat naive CSV to Html function in SQL.

It's real purpose is an intermediate step before turning the Html into XML, so you can have 1 row per item in the original CSV.


	ALTER FUNCTION [dbo].[CsvToHtml] (@value AS nvarchar(max), @separator as nvarchar(10))
	RETURNS nvarchar(max)
	AS 
		BEGIN
			return 
					 '<li>' +					-- Wrap in list item html
						REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( -- Perform 5 replacements, count them:
							@Value, 
							' ',''),					-- 1. remove spaces
							CHAR(13), ''),				-- 2. remove carriage returns
							CHAR(10), @separator),		-- 3. treat line feeds as commas (separators)
							'&', '&amp;'),				-- 4. XML encode ampersands.
							@separator, '</li><li>')	-- 5. turn separators into new list item markers
						+ '</li>' 
		END
	GO

Given:

	select [dbo].[CsvToHtml]('a,b,c', ',')
	
	
It will return:	

	<li>a</li><li>b</li><li>c</li>


	
Now you can put that function inside this one...	
	
	ALTER FUNCTION [dbo].[CsvToXml] (@value AS nvarchar(max), @separator as nvarchar(10))
	RETURNS xml
	AS 
	BEGIN
		return 
		CONVERT(XML, [dbo].[CsvToHtml](@value, @Separator)).query('.')
	END

	
Given

	select [dbo].[CsvToXml]('a,b,c', ',')

It will return this XML type:

	<li>a</li>
	<li>b</li>
	<li>c</li>


	
Imagine we have a fictional blogging system with an annoying CSV column called `Article`.`Tags`
	
		Select 
			a.Name,
			nodes.li.value('.','nvarchar(max)') as as Tag
		FROM 
		( 
			SELECT tempXml = dbo.CsvToXml(a.Tags, ','),
				Name
			FROM Articles a
		) AS a CROSS APPLY tempXml.nodes('li') AS nodes(li)
		where 
		not nodes.li.value('.','nvarchar(max)') is null	

...and now we have a list of all the tags, 1 per row, adjacent to its article name.


