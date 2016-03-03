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