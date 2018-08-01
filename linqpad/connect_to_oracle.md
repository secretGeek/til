# Connect Linqpad to Oracle

...using an IQ Connection.


Step 1, `Add connection`

![Click add connection](add_connection.png)

Step 2, click `view more drivers`

![Click view more drivers](view_more_drivers.png)


Step 3, Find "IQ Driver - for MySQL, SQLite, Oracle"

![Find IQ Driver](find_iq_driver.png)

click "Download & Enable Driver"

Now when you choose "Add Connection" you'll forever see "IQ" listed.

![Add connection shows IQ](add_connection_shows_iq_driver.png)

Pick Next.

Choose `Direct (Oracle Client not Required)`

(it has these limitations: <http://www.devart.com/dotconnect/oracle/docs/DirectMode.html>


Now here are the tricks....

Given this connection string


	"Data Source=SRV1238xx1.example.com:1234/DS128x; User Id=UserUser; Password=PassPass;"
	

On the dialog, you would set:

	Server = SRV1238xx1.example.com
	User = UserUser
	password = PassPass

Give it a friendly name

Then on the 'Advanced' tab Set:

	Port = 1234

And in addition connection string options, type:

	Service Name=DS128x
	
**Note the space between Service and Name**

Optionallly, you can set a default schema, if you know a schema that you're most interested in. (It's not mentioned in the example connection string above. Setting one will allow you to browse the schema details: list of tables, views, columns, etc.)

Hit `test` to test. And Bob's your Uncle.


