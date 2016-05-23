# Mismatch between estimated and actual number of rows returned in Execution Plan.

If you have mismatch between estimated and actual number of rows returned in a SQL Server Execution Plan, the classic advice is that "your statistics may be out of date."

By default, statistics are configured to be updated automatically, and SQL Server's pretty smart about it. 



# Actual smaller than estimated:

Kendra Little gives a counter example in the article [Query Plans: Memory Grants and High Row Estimates](https://www.brentozar.com/archive/2013/08/query-plans-what-happens-when-row-estimates-get-high/) where she shows that using functions in your predicates can make SQL Server pessimistic about the expected number of matches, which in turn causes `estimated` to be much greater than `actual`, consuming unneccessary resources etc.


# Actual LARGER than estimated:

[Grant Fritchey says](http://www.sqlservercentral.com/Forums/Topic513086-360-1.aspx) that when  a table valued function, particularly a multi-statement function, is used:

> the optimizer doesn't and can't know what to do with that when it's designing the execution plan, so it creates a plan for a one row table.


GSquared, in that same thread, adds that **Table variables** and **Recursive CTEs** are both often estimated at 1 row, though the actual may be higher.



# Tools

I've been using SQL Sentry's free Plan Explorer from http://sqlsentry.net/plan-explorer/.

