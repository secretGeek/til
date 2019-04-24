# Get text of a view from Oracle


There are no doubt other ways to get this, but what I've used is:


	select TEXT 
			  FROM DBA_VIEWS 
			  where OWNER = 'THE_OWNER'  and VIEW_NAME  = 'THE_VIEW'

...and you'll need to substitute the correct owner name and view name.