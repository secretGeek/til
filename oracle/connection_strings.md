# Connection Strings in Oracle


Example:
    User Id=scott;Password=tiger;Data Source=bbSales12

In this case `bbSales12` is an alias.

To resolve this alias, Oracle first looks in "the connection pool" to see if it has already "Resolved" that alias.

Next it looks in `tnsnames.ora.`


`tnsnames.ora` is a file that contains enough configuration detail that your machine should be able to connect to the remote machine.

How does Oracle find the `tnsnames.ora` file?

Oracle relies on an environment variable, TNS_ADMIN, which contains the folder name in which `tnsnames.ora` is stored.

If you don't have this environment variable set, then Oracle will not be able to find the tnsnames.ora file (or the sqlnet.ora file, which will be described later)

In `tnsnames.ora` you should find the alias defined via a piece of configuration language like this:

bbSales12=
 (DESCRIPTION= 
  (ADDRESS= (PROTOCOL=tcp)(HOST=bb12Sales-server3)(PORT=1521))
  (CONNECT_DATA= 
     (SERVICE_NAME=sales.us.acme.com)))

You can also use "Easy Connect Naming Method"

Instead of an alias, you specify a datasource in this form: 

    //host:[port]/[service_name]

example:    

    "user id=scott;password=tiger;data source=//bb12Sales-server3:1521/sales.us.acme.com"     


But note that:

    Prior to using the easy connect naming method, make sure that EZCONNECT is specified by the NAMES.DIRECTORY_PATH parameter in the sqlnet.ora file.

"sqlnet.ora" is a file which is also searched for in the TNS_ADMIN folder


Inside that file, if you specify

    NAMES.DIRECTORY_PATH= (TNSNAMES, EZCONNECT)

...then you'll be able to use "the Easy Connect Naming Method".


## Source

 * <http://www.secretgeek.net/tnsnames>