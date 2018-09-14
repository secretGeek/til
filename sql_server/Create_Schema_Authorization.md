# Create Schema with Authorization

When Creating schemas, if you don't specify the 'Authorization' then the 'owner' of the schema will be the user who ran the script.

So specify `DBO` for example, with a script like this:

	CREATE SCHEMA [BUSINESS] Authorization DBO
