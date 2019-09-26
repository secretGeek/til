#slow and long running queries

Query to show which queries are the worst performers.




    SELECT TOP 50 creation_time 
            ,last_execution_time
            ,total_physical_reads
            ,total_logical_reads 
            ,total_logical_writes
            , execution_count
            , total_worker_time
            , total_elapsed_time
            , total_elapsed_time / execution_count avg_elapsed_time
            ,SUBSTRING(st.text, (qs.statement_start_offset/2) + 1,
             ((CASE statement_end_offset
              WHEN -1 THEN DATALENGTH(st.text)
              ELSE qs.statement_end_offset END
                - qs.statement_start_offset)/2) + 1) AS statement_text
    FROM sys.dm_exec_query_stats AS qs
    CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
    where last_execution_time > '18 Feb 2016'
    ORDER BY total_elapsed_time / execution_count DESC;

    
You may want to change the Order by...

You may lacks permissions to run this. Specifically:

	VIEW SERVER STATE permission was denied on object 'server', database 'master'.

Which requires this to be executed:


	use master
	go
	GRANT VIEW SERVER STATE TO <user_name>

...if possible.