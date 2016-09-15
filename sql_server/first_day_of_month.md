# First (and last) day of the month.

Given a datetime, tells you the first day of the month.

    CREATE FUNCTION dbo.FirstDayOfMonth(@datetime datetime)
    RETURNS DATETIME AS
    BEGIN
        RETURN DATEADD(MONTH,DatePart(MONTH, @datetime)-1,DATEADD(YEAR,DatePart(YEAR, @datetime)-1900,0))
    END

Or even better...

    CREATE FUNCTION dbo.FirstDayOfMonth(@datetime datetime)
    RETURNS DATETIME WITH SCHEMABINDING AS
    BEGIN
        return DATEADD(month, DATEDIFF(month, 0, @datetime), 0)
    END

And for good measure, here's the last day of the month
    
    
    CREATE FUNCTION [dbo].[LastDayOfMonth](@datetime datetime)
    RETURNS DATETIME AS
    BEGIN
        RETURN DATEADD(DAY,-1,DATEADD(MONTH,1+DatePart(MONTH, @datetime)-1,DATEADD(YEAR,DatePart(YEAR, @datetime)-1900,0)))
    END

    
## See also

 * [Trim or zero-out a portion of a datetime](datetime_trim_hours_milliseconds.md)