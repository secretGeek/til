# Set a database to simple recovery model

This is how you turn off needing to log everything.

Simple recovery model is ok for dev, not for prod.



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