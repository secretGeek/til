# Create a role that gives a user permissions on a specific schema.

Creates a role named 'SpecificSchemaSuperPowers'

That gives specific permissions (ALTER, DELETE, EXECUTE, INSERT, REFERENCES, SELECT, UPDATE, VIEW DEFINITION) on a specific schema 'SpecificSchema' 

(And adds a particular user (AD\BambrickL) to that role)

as follows:

    CREATE ROLE SpecificSchemaSuperPowers AUTHORIZATION dbo;

    GRANT ALTER, DELETE, EXECUTE, INSERT, REFERENCES, SELECT,
              UPDATE, VIEW DEFINITION ON SCHEMA::SpecificSchema TO SpecificSchemaSuperPowers;

    EXEC sp_addrolemember 'SpecificSchemaSuperPowers', 'AD\BambrickL';

