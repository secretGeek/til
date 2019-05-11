# sparql -- basics



	SELECT ?a ?b ?c
	WHERE
	{
	  x y ?a.
	  m n ?b.
	  ?b f ?c.
	}
	LIMIT 10
	
Note that `x y ?a.`

..means "x relates in way y to value ?a"

..e.g. `y` could be... "hasColor" ... or some other arbitrary relationship indicator.



	
	
## Source

 * <https://www.wikidata.org/wiki/Wikidata:SPARQL_tutorial>
 * [Video: SPARQL in 11 minutes](https://www.youtube.com/watch?v=FvGndkpa4K0)