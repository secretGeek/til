# To Sort Unique


    sort -unique

e.g.

    1..100 | % { $_ % 5} | sort -unique
    
    
# To Sort by a Property

use:

    sort -property "propertyName"

e.g. 

    get-alias -def "get*" | sort -property definition | ft -property Name, Definition
    
