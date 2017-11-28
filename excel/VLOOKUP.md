# VLOOKUP

Sick of looking up the syntax to VLOOKUP. (Glad I use it rarely enough that it's not committed to memory)

    
    VLOOKUP (lookup_value, table_array, col_index_num, [range_lookup])
    
    
Example:

    =VLOOKUP("Puppy",B3:F2000,2,FALSE)
    

Translation:

> Look in the array `B3:F2000`, for the value 'Puppy' in the first column. Return the value from the 2nd column. (The first column contained 'Puppy')


And the `false` means "Do not use fuzzy match". I don't know what fuzzy match means I just know I don't want it. Always go 'false'.


However -- that's rarely enough!

If a simple vlookup fails to find any results it will output a big ugly N/A#!!

So -- wrap it in an iferror...

    =IFERROR(VLOOKUP(D4,B1:B418,2,FALSE),"")

    
And also -- I am usually referencing something on a different sheet... so to do that, you address the other sheet, followed by a bang



    =IFERROR(VLOOKUP(D4,Sheet1!$B$3:$F$2000,2,FALSE),"")
	=IFERROR(VLOOKUP(C2,Sheet2!$A1:$C$52,2,FALSE),"")
