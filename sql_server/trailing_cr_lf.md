# Trailing Cr Lf

Trailing Carriage return (\r) and Linefeed (\n) in a varchar are really hard to detect in SSMS. 


Imagine there's three columns, A, B and C that have the same content except B has two trailing spaces and C has a trailing '\r\n'.

    Select A,B,C from Table


In SSMS the grid will silently turn the '\r\n' into two spaces. 

So it will look like B and C both have two trailing spaces.


If you compare A=B it will return `true` (because 'A' == 'A  ' according to SQL)

If you compare B=C (or A=C) it will return 'false' -- even though A and B will both look (in the grid) like they have trailing spaces.

If you switch the output to text mode, the carriage return line feed will be retained.





