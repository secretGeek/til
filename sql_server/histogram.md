# Example query for bucketing up a bunch of values.

Example of sorting results into buckets (ranges), and showing the count in each bucket, as well as the average of some other column, for members in that bucket.


    declare @interval int = 5000 --bucket size
    Select 
        --@interval * Floor(DirectDistance/@interval) as Min_,
        --@interval * Floor(DirectDistance/@interval) + @Interval - 1 as Max_,
        '' + Cast((@interval * Floor(DirectDistance/@interval)) as varchar(20))  + ' - ' + 
            Cast((@interval * Floor(DirectDistance/@interval) + @Interval - 1) as varchar(20)) as 'Range',
        --Floor(DirectDistance/@interval) as Bucket,
        AVG(Metres_Per_Minute) as Avg_Metres_Per_Minute,
        COUNT(*) as Number_of_Examples
    from 
        GIS.TravelTimeExamples
    group by 
        Floor(DirectDistance/@interval)
    having COUNT(*) > 15
    order by 
        Floor(DirectDistance/@interval)  --order by bucket