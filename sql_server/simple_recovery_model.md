# Set a database to simple recovery model





	ALTER DATABASE MyDatabase SET RECOVERY SIMPLE;
	
	
To find the current recover model:


	SELECT name, recovery_model_desc  
	   FROM sys.databases  
		  WHERE name = 'MyDatabase' ;  
	GO 	
	

example:

	
|name|recovery_model_desc|
|----|-------------------|
|MyDatabase|FULL|