# Sick of typing sp_heltpext ?


Create a function `sp_heltpext` which channels the parameter to `sp_helptext` 

    Alter Procedure sp_heltpext (@Sprocname varchar(500))
    AS
    BEGIN
        print 'Assuming you meant:'
        print 'sp_helptext ' + '''' + @sprocname + ''''
        print ''
        exec sp_helptext @sprocname
    END

