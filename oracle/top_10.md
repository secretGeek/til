# Select top (10) in oracle

    SELECT * FROM (
        ... Your query here...   SELECT FROM WHERE
        )
    WHERE ROWNUM <= 10


And, although it's offtopic, let me add that in mysql you use LIMIT, e.g.

    SELECT *
    FROM Persons
    LIMIT 5;

