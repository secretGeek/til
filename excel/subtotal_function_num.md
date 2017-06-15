# Subtotal function (used in tables) what is the function num?

I frequently use little tables, particularly to format data in preparation for sending in an email.

I just needed to add a subtotal row, and saw I could check "subtotal" as one of the options for the table.

It added just one aggregate figure, and it had a formula like this:

    =SUBTOTAL(103,[TotalSpaceMB])

    
It was doing a count of rows, not a SUM as I wanted. Looking into it,  `103` was described as a function number. (This is not peak-lambda).

What is the function number for SUM ? Use this handy table!
    

|Function|Include hidden|Ignore hidden|
|----|----|----|
|AVERAGE|1|101|
|COUNT|2|102|
|COUNTA|3|103|
|MAX|4|104|
|MIN|5|105|
|PRODUCT|6|106|
|STDEV|7|107|
|STDEVP|8|108|
|SUM|9|109|
|VAR|10|110|
|VARP|11|111|


Note that `COUNTA` is different from `COUNT`, because `COUNTA` only counts "non-blank" values.

So for `SUM`, use `109`.

e.g.

    =SUBTOTAL(109,[TotalSpaceMB])
