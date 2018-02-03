# How to insert identity values into an identity column

Just try it and you'll get:

	Msg 544, Level 16, State 1, Line 6
	Cannot insert explicit value for identity column in table 'YourTable' when IDENTITY_INSERT is set to OFF.
	
So simply:

	SET IDENTITY_INSERT YourTable ON

	INSERT sometableWithIdentity (ID, col2, col3, ...)
	VALUES (33, 'fred', 'smith', ...)

	SET IDENTITY_INSERT YourTable OFF
	
But first:

> Have you tried *not* explicity setting a value for the identity column?