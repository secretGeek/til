# WITH (common table expressions)

Common table expressions are a good way to reuse a piece of SQL.

    ;WITH Sales_CTE 
    AS
    -- Define the CTE query.
    (
        SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear
        FROM Sales.SalesOrderHeader
        WHERE SalesPersonID IS NOT NULL
    )
    -- Define the outer query referencing the CTE name.
    SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear
    FROM Sales_CTE
    GROUP BY SalesYear, SalesPersonID
    ORDER BY SalesPersonID, SalesYear;
    GO

Bonus points: **recursive** CTEs.
    
The general form is:

    Define a base case.
    UNION ALL
    Define a recursive case.

Example:
    
    ;WITH cte AS
    (
        -- Define a base case
        SELECT CAST('/' + Name AS VARCHAR(50)) as 'CteName', ID
        FROM dbo.YourTable
        WHERE parent_id IS NULL

        -- UNION ALL
        UNION ALL

        -- Define a recursive case
        SELECT CAST(cte.CteName + '/' + Name AS VARCHAR(50)), t.ID
        FROM dbo.YourTable t
        INNER JOIN cte ON t.parent_id = cte.id
    )
    SELECT cteName FROM cte
    ORDER BY ID
