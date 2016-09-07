# Create a role that gives a user permissions on a specific schema.



    CREATE ROLE SpecificSchemaSuperPowers AUTHORIZATION dbo;

    GRANT ALTER, DELETE, EXECUTE, INSERT, REFERENCES, SELECT,
              UPDATE, VIEW DEFINITION ON SCHEMA::SpecificSchema TO SpecificSchemaSuperPowers;

    EXEC sp_addrolemember 'SpecificSchemaSuperPowers', 'AD\BambrickL';