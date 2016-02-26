# Search all views functions or sprocs for a piece of text

This is my most used snippet in "kv" (key value snippet storer).

    select distinct schema_name(so.uid) + '.' + so.name from syscomments sc inner join sysobjects so on sc.id = so.id where sc.text like 
'%%'