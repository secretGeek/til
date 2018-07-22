# Basic data dictionary

2. Summary of tables:
3. Data Dictionary

*****


## Available space on server



	EXEC master..xp_fixeddrives


## helpdb

    sp_helpdb 'dbName'



## Spaceused

    use dbName
    sp_spaceused




*****

## Summary of tables:

	use dbName
	SELECT 
		s.[Name] as [Schema],
		t.[Name]  as [Table],
		p.[Rows] AS [# Rows],
		(SUM(a.total_pages) * 8)/1024 AS [Total Space MB], 
	--    (SUM(a.used_pages) * 8)/1024 AS [Used Space MB], 
		((SUM(a.total_pages) - SUM(a.used_pages)) * 8/1024) AS [Unused Space MB],
		case when p.rows > 0 then ((SUM(a.used_pages)*8000 ) / p.rows) else 0 end as [Bytes Per Row]
	FROM 
		sys.tables t
	INNER JOIN      
		sys.indexes i ON t.OBJECT_ID = i.object_id
	INNER JOIN 
		sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
	INNER JOIN 
		sys.allocation_units a ON p.partition_id = a.container_id
	LEFT OUTER JOIN 
		sys.schemas s ON t.schema_id = s.schema_id
	WHERE 
		t.NAME NOT LIKE 'dt%' 
		AND t.is_ms_shipped = 0
		AND i.OBJECT_ID > 255 
	GROUP BY 
		t.Name, s.Name, p.Rows
	ORDER BY 
		1


-----


## Data Dictionary

	use dbName
	SELECT 
		schema_name(so.[schema_id]) as [Schema],
		so.[name] AS [Table],
		sc.[name] AS [Column],
		st.[name] AS [Type],
		sc.[max_length] AS [Size]
	FROM
		sys.objects so INNER JOIN sys.columns sc 
	ON 	so.object_id = sc.object_id INNER JOIN sys.types st 
	ON 	st.system_type_id = sc.system_type_id 
	AND	st.name != 'sysname'
	WHERE 
		so.type = 'U'
	ORDER BY 
		1,2,3
