# Sick of typing sp_heltpext ?


Alter Procedure sp_heltpext (@Sprocname varchar(500))
AS
BEGIN
	print 'Assuming you meant:'
	print 'sp_helptext ' + '''' + @sprocname + ''''
	print ''
	exec sp_helptext @sprocname
END

