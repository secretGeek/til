# Format DateTime as yyyy-MM-dd


    Left(CONVERT(VARCHAR(19), GetDate(), 120), 10)
    
e.g.
    
    select left(CONVERT(VARCHAR(19), GetDate(), 120), 10)
    2017-02-02
    
    
Or for the ever useful sortable reporting month: yyyy-MM

    Select left(CONVERT(VARCHAR(19), GetDate(), 120), 7)    
    2017-02

## See also

 * [just the date portion of a datetime](datetime_trim_hours_milliseconds.md)