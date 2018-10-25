# Prevent saving changes that require the table to be re-created.

You are modifying a table, using `Design table` in SSMS, and want to generate a change script (or maybe you want to save your change)



	Table Designer &rarr; Generate Change Script

	
Sql Server Management Studio (SSMS) produces this error:
	
	
> Saving changes is not permitted. The changes you have made require the following changes to be dropped and re-created. You have either made changes to a table that can't be re-created or enabled te option Prevent saving changes that require the table to be re-created.


Oh no!

To enable this option, go to:



	Tools &rarr; Options &rarr; Designers &rarr; Table and Database Designers &rarr; Table Options

	Prevent saving changes that require table re-creation