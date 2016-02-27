# VLOOKUP

Sick of looking up the syntax to VLOOKUP. (Glad I use it rarely enough that it's not committed to memory)

    
    VLOOKUP (lookup_value, table_array, col_index_num, [range_lookup])
    
    
Example:

    =VLOOKUP("Puppy",B3:F2000,2,FALSE)
    

Translation:
>   Look in the array (B3:F2000), for the value 'Puppy' in the first column. Return the value from the 2nd column. 


And the false means "Do not use fuzzy match". I don't know what fuzzy match I just know I don't want it.

Always go 'false'.
