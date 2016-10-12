# Log message syncrhonously during a long running procedure

Sometimes you have a long running process, and you want it to emit messages, but you don't want to wait until the end to see those messages.

Then raise them as errors, as follows:


	SET @Message = 'Begin Switcharoo at ' + CAST(GETDATE() AS VARCHAR(50))

	RAISERROR (@Message, 0, 1) WITH NOWAIT


You can even use this form of messaging inside TRY/CATCH statements because:	
	
> TRY/CATCH in SQL will only catch errors with severity > 10, so using RAISERROR in this way won't jump into your CATCH statement.