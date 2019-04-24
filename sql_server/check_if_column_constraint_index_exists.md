# Check if Column exists, or if constraint exists or if index exists (including spatial index)


To check if a column exists (before adding the column)


	IF NOT EXISTS(
	  SELECT *
	  FROM INFORMATION_SCHEMA.COLUMNS
	  WHERE 
		TABLE_SCHEMA = 'MySchema'
		AND TABLE_NAME = 'MyTable'
		AND COLUMN_NAME = 'OBJECTID')
	BEGIN
		ALTER TABLE MySchema.MyTable ADD
			OBJECTID int NOT NULL IDENTITY (1, 1),
			Geo geography NULL
	END

	
To check if a constraint exists (before adding the constraint)
	
		
	IF NOT EXISTS(
	  SELECT *
	  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	  WHERE 
		TABLE_SCHEMA = 'MySchema'
		AND TABLE_NAME = 'MyTable'
		AND CONSTRAINT_NAME = 'PK_constraintname')
	BEGIN
		ALTER TABLE MySchema.MyTable ADD CONSTRAINT
			PK_constraintname PRIMARY KEY CLUSTERED 
			(
			OBJECTID
			) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	END


	
To check if an index exists (before adding the index - a spatial index in this case)


	IF NOT EXISTS(
		SELECT * 
		FROM sys.indexes 
		WHERE name='SPATIAL_index' AND object_id = OBJECT_ID('MySchema.MyTable'))
	BEGIN
		CREATE SPATIAL INDEX SPATIAL_index ON MySchema.MyTable(Geo) USING GEOGRAPHY_GRID
			 WITH( GRIDS  = ( LEVEL_1  = MEDIUM, LEVEL_2  = MEDIUM, LEVEL_3  = MEDIUM, LEVEL_4  = MEDIUM), CELLS_PER_OBJECT  = 16, STATISTICS_NORECOMPUTE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
	END
