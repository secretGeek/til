# Updating millions of rows from SQL Server


So, you have a [large table](.\find_large_tables.md) where you need to update every row, using some condition.

If you run a:

    UPDATE SOMETABLE SET NAME = 'FRED'
    WHERE "SOME_CONDITION"

...you'll be waiting a long time. The table will be locked, the transaction space will grow and grow, and you won't know if it will ever finish until it does... or it doesn't.


One "trick" that people talk about is turning off indexes, so they don't have to be updated. But that's only good for **inserts**, not updates because you end up having to do table scans to **find** the rows to update. So don't turn off indexes: double-down on indexes. **Make sure the query you're using is able to efficiently find the records it wants to update.**

Some people say select the table into a new, transformed table, then drop the old and rename the new. That can double your space requirements and I think it can eradicate your statistics so I don't really go in for that.

What I like is the little loopy methods with 'update top(n)', similar (almost identical, natch) to the technique I use for [Deleting millions of rows from SQL Server](delete_millions_of_rows.md).

This example uses `Update top(@batchsize) ... ` in a `while` loop to do the needful, and you'll get a sense of how long it will take... If it gets interrupted it can resume.

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
    SET @WAITFORVAL = '00:00:10' -- Delay between updates **** UPDATE THIS ****
    SET @MAXRUNTIME = '08:00:00' -- 8AM
    SET @BSTOPATMAXTIME = 1 -- ENFORCE 8AM STOP TIME
    SET @ITERATION = 0 -- LEAVE THIS
    SET @TOTALROWS = 0 -- LEAVE THIS

    SET @STARTALL = GetDate()

    WHILE @BATCHSIZE>0
    BEGIN
        -- IF @BSTOPATMAXTIME = 1, THEN WE'LL STOP THE WHOLE JOB AT A SET TIME...
        IF CONVERT(VARCHAR(8),GETDATE(),108) >= @MAXRUNTIME AND @BSTOPATMAXTIME=1
        BEGIN
            RETURN
        END

        SET @STARTBATCH = GetDate()

        /* vv You need to update this! ***** */
        UPDATE TOP(@BATCHSIZE)
		SET Column1 = 'Value'
        FROM SOMETABLE
        WHERE SOMECONDITION
        /* ^^ You need to update that ***** */

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

        WAITFOR DELAY @WAITFORVAL  -- ** DECIDE IF YOU WANT THIS BREATHING-ROOM DELAY ON EACH LOOP....
    END

    SET @MSG = 'TOTAL elapsed: ' +
      CAST(DATEDIFF(s, @STARTALL, @ENDBATCH) as varchar) +
      ' seconds. Total rows: ' + CAST(@TOTALROWS AS VARCHAR) +
      '. Final Speed: ' + CAST(CAST(@TOTALROWS as float)/(DATEDIFF(s, @STARTALL, @ENDBATCH)) AS VARCHAR) +
      ' rows per second'
    RAISERROR (@MSG, 0, 1) WITH NOWAIT






## See also

 * [Deleting millions of rows from SQL Server](delete_millions_of_rows.md)
 * [Find large tables](.\find_large_tables.md)
 * [Log Message Asynchronously](.\Log_Message_During_LongRunning_Proc.md)