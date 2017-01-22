# Format DateTime as yyyy-MM-dd


    Left(CONVERT(VARCHAR(19), GetDate(), 120), 10)
    
e.g.
    
    select left(CONVERT(VARCHAR(19), GetDate(), 120), 10)
    2017-01-17
    
## See also

 * [just the date portion of a datetime](datetime_trim_hours_milliseconds.md)