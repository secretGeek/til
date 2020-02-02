# Format DateTime as yyyy-MM-dd

You want ISO8601 formats in SQL Server, here you go.

For `yyyy-MM-dd` :

    CONVERT(VARCHAR(10), GetDate(), 120)

e.g.
    
    select CONVERT(VARCHAR(10), GetDate(), 120)
    2017-02-02


Format "120" is 24-hour time, down to the second. But we limit the size of the result to remove the time component.

To include the time component just use a varchar that is 19 or more characters long, e.g. 50


    select CONVERT(VARCHAR(50), GetDate(), 120)
    2017-02-02 11:09:53


Or for the ever useful sortable reporting month: yyyy-MM

    Select CONVERT(VARCHAR(7), GetDate(), 120)
    2017-02


To get milliseconds (and 24 hour time) use format "121" -- it extends 120 by including the milliseconds.

    Select CONVERT(VARCHAR(23), GetDate(), 121)
    2017-02-02 11:52:33.980


(Any length 23 or larger will suffice)



## See also

 * [SQL: just the date portion of a datetime](datetime_trim_hours_milliseconds.md)
 * [Excel: Extract Year/Month (for grouping/reporting)](../excel/extract_year_and_month_from_date_for_grouping_purposes.md)
 * [Parse varchar into DateTime](parse_varchar_into_datetime.md)