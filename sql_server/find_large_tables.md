# Find (and fix) large tables

Some tables too big? Running out of space in your database?

Easy to find:


    SELECT top 50
        t.NAME AS TableName,
        s.Name AS SchemaName,
        p.rows AS RowCounts,
        (SUM(a.total_pages) * 8)/1024 AS TotalSpaceMB,
        (SUM(a.used_pages) * 8)/1024 AS UsedSpaceMB,
        ((SUM(a.total_pages) - SUM(a.used_pages)) * 8/1024) AS UnusedSpaceMB,
        case when p.rows > 0 then ((SUM(a.used_pages)*8000 ) / p.rows) else 0 end as bytes_per_row
    FROM
        sys.tables t
    INNER JOIN
        sys.indexes i ON t.OBJECT_ID = i.object_id
    INNER JOIN
        sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
    INNER JOIN
        sys.allocation_units a ON p.partition_id = a.container_id
    LEFT OUTER JOIN
        sys.schemas s ON t.schema_id = s.schema_id
    WHERE
        t.NAME NOT LIKE 'dt%'
        AND t.is_ms_shipped = 0
        AND i.OBJECT_ID > 255
    GROUP BY
        t.Name, s.Name, p.Rows
    ORDER BY
        4 desc, 5 desc


(There's also some built in reports... but a query is the best UI)


## Source

 * [Get size of all tables in database](http://stackoverflow.com/questions/7892334/get-size-of-all-tables-in-database)