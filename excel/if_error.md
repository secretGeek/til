# Avoid `#VALUE!` with IFERROR

Sick of you carefully crafted excel formula resulted in `#VALUE!` for all the edge cases you don't care about?

Just wrap your formula in an IFERROR function.....

e.g. here's a formula for grabbing everything before the first comma....

	=LEFT(B3, FIND(",", B3)-1)
	
...but what happens when there is no comma!? A dirty great error that's what!

So wrap it in an `IFERROR` instead my smooth friend:

	=IFERROR(LEFT(B3, FIND(",", B3)-1),"")	

Arh! That better!

And for completeness, here's a sneaky formula to get everything after the first space...

	=IFERROR(TRIM(MID(C2 & REPT(" ", 100), FIND(" ", C2), 50)),"")
	

## Sources

* [Excel Formula: Split text with delimiter](https://exceljet.net/formula/split-text-with-delimiter) &mdash; some nice examples here
