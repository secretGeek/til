# Deleting millions of rows from SQL Server


So, you've [found large tables](.\find_large_tables.md) and now you want to trim them down to size... Not drop them them, just delete most of the rows, using some conditions.

If you run a:

    DELETE FROM SOMETABLE
    WHERE "SOME_CONDITION"

...you'll be waiting a long time.

As it alleges in the comments at the [source](http://stackoverflow.com/questions/24785439/deleting-1-millions-rows-in-sql-server):

> Any delete operation will causing locking - on the row level. But once your transaction has more than 5000 row-level locks, SQL Server will do a lock escalation and lock the entire table in exclusive mode<br />&mdash;marc_s


So this uses `Delete top(@batchsize) ... ` in a `while` loop to do the needful.

	DECLARE
		@BATCHSIZE INT,
		@WAITFORVAL VARCHAR(8),
		@ITERATION INT,
		@TOTALROWS INT,
		@MAXRUNTIME VARCHAR(8),
		@BSTOPATMAXTIME BIT,
		@MSG VARCHAR(500),
		@STARTALL DATETIME,
		@STARTBATCH DATETIME,
		@ENDBATCH DATETIME

	SET DEADLOCK_PRIORITY LOW;
	SET @BATCHSIZE = 4000;
	SET @WAITFORVAL = '00:00:10' -- Delay between deletes -- UPDATE THIS
	SET @MAXRUNTIME = '08:00:00' -- 8AM
	SET @BSTOPATMAXTIME = 1 -- ENFORCE 8AM STOP TIME
	SET @ITERATION = 0 -- LEAVE THIS
	SET @TOTALROWS = 0 -- LEAVE THIS

	SET @STARTALL = GetDate()

	WHILE @BATCHSIZE>0
	BEGIN
		-- IF @BSTOPATMAXTIME = 1, THEN WE'LL STOP THE WHOLE JOB AT A SET TIME...
		IF @BSTOPATMAXTIME=1 AND CONVERT(VARCHAR(8),GETDATE(),108) >= @MAXRUNTIME
		BEGIN
			RETURN
		END

		SET @STARTBATCH = GetDate()

		/* vv You need to update this!*/
		DELETE TOP(@BATCHSIZE)
		FROM SOMETABLE
		WHERE SOMECONDITION
		/* ^^ You need to update that */

		SET @BATCHSIZE=@@ROWCOUNT
		SET @ENDBATCH = GETDATE()


		SET @ITERATION=@ITERATION+1
		SET @TOTALROWS=@TOTALROWS+@BATCHSIZE
		SET @MSG = 'Iteration: ' + CAST(@ITERATION AS VARCHAR) + ' Total deletes:' + CAST(@TOTALROWS AS VARCHAR)
		RAISERROR (@MSG, 0, 1) WITH NOWAIT
		SET @MSG = 'Batch duration: ' +
				Cast(DATEDIFF(s, @STARTBATCH, @ENDBATCH) as varchar) +
				' seconds. Batch Speed ' + CAST(CAST(@BATCHSIZE as float)/(DATEDIFF(s, @STARTBATCH, @ENDBATCH)) AS VARCHAR) +
				' rows per seconds. Subtotal elapsed: ' +
				CAST(DATEDIFF(s, @STARTALL, @ENDBATCH) as varchar) +
				' seconds. Cumulative Speed ' + CAST(CAST(@TOTALROWS as float)/(DATEDIFF(s, @STARTALL, @ENDBATCH)) AS VARCHAR) +
				' rows per second'
		RAISERROR (@MSG, 0, 1) WITH NOWAIT
		WAITFOR DELAY @WAITFORVAL
	END

	SET @MSG = 'TOTAL elapsed: ' +
	  CAST(DATEDIFF(s, @STARTALL, @ENDBATCH) as varchar) +
	  ' seconds. Total rows: ' + CAST(@TOTALROWS AS VARCHAR) +
	  '. Final Speed: ' + CAST(CAST(@TOTALROWS as float)/(DATEDIFF(s, @STARTALL, @ENDBATCH)) AS VARCHAR) +
	  ' rows per second'
	RAISERROR (@MSG, 0, 1) WITH NOWAIT



## Source

 * [Deleting 1 millions rows in SQL Server](http://stackoverflow.com/questions/24785439/deleting-1-millions-rows-in-sql-server)

## See also

 * [Updating millions of rows from SQL Server](update_millions_of_rows.md)
 * [Find large tables](.\find_large_tables.md)
 * [Log Message Asynchronously](.\Log_Message_During_LongRunning_Proc.md)