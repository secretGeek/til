# To Sort Unique

    sort -unique

e.g.

    1..100 | % { $_ % 5} | sort -unique

# To Sort by a Property

use:

    sort -property "propertyName"

e.g. 

    get-alias -def "get*" | sort -property definition | ft -property Name, Definition

Another example:

You can sort a file's content by the length of its lines by using:

    cat $file | sort -property Length

To sort by file date descending (and pick only the top 10):

	dir | sort lastwritetime -desc | select -f 10
