# Trailing Cr Lf

Trailing Cr and Lf in a varchar are really hard to detect.


Imagine there's three columns, A, B and C that have the same content except B has two trailing spaces and C has a trailing \r\n.

    Select A,B,C from Table


In SSMS the grid will silently turn the \r\b into two spaces. 

So it will look like B and C both have two trailing spaces.


If you compare A=B it will return `true` (because 'A' == 'A  ' accoding to SQL)

If you compare B=C (or A=C) it will return 'false' -- even though A and B will both look (in the grid) like the have trailing spaces.

If you switch the output to text mode, the carriage return line feed will be retained.




