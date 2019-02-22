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

## Bonus points: **recursive** CTEs.
    
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


	
## Multiple CTE's...

To define multiple....


    ;WITH Sales_CTE 
    AS
    -- Define the First CTE query.
    (
        SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear
        FROM Sales.SalesOrderHeader
        WHERE SalesPersonID IS NOT NULL
    ),
	-- ^ Comma, followed by the Next CTE
    Miles_Driven_CTE AS
	(
		Select SalesPersonID, YEAR(TripDate) as Year, SUM(Distance) as Miles
		FROM Vehicle.Usage
		GROUP BY SalesPersonID, YEAR(TripDate)
	)
    -- Define the outer query referencing ANY/ALL OF the CTE name.
    SELECT s.SalesPersonID, COUNT(s.SalesOrderID) AS TotalSales, m.Miles, m.Year
    FROM Sales_CTE s
	INNER JOIN Miles_Driven_CTE m on s.SalesPersonID = m.SalesPersonID AND m.Year = s.SalesYear
    GROUP BY m.Year, s.SalesPersonID
    ORDER BY s.SalesPersonID, m.Year desc;
    GO


Note that a CTE *can* refer to any of the preceeding CTEs.

And that we often write a ';' before the 'WITH' so that the compiler is happy. Compilers have inflexible wishes.
