# Collation....

# Find default collation of the database

	Select DatabasePropertyEx('DATABASE_NAME','Collation')
	
	

# Find collation of a column


	SELECT name, collation_name
	FROM sys.columns
	WHERE OBJECT_ID IN (SELECT OBJECT_ID
	FROM sys.objects
	WHERE type = 'U'
	AND SCHEMA_NAME(schema_id) = 'MySchema'
	AND name = 'MyTable')
	AND name = 'MyColumn'


# Compare two values that have different collation


	Select p.Name, w.Age
	from
	Person p
	inner join Attributes w
	on p.id = w.id collate database_default


	
# Find all collations used in a database


	SELECT distinct collation_name
	FROM sys.columns
	
e.g.

|Collation_Name|
|--------------|
|NULL|
|Latin1_General_BIN|
|Latin1_General_CI_AS|
|Latin1_General_CI_AS_KS_WS|
|SQL_Latin1_General_CP1_CI_AS|
