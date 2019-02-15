# DataReader.GetFieldType returned null (for Geography) 


Given a SQL query such as:


	Select ObjectID, GEO from Rivers

...where `GEO` is a `Geography`, any piece of C# code such as:

	var data = new DataSet();
    using (var da = new SqlDataAdapter(sqlCommand))
	{
		numRows = da.Fill(data);
    }


...can *fail* with this error:

	DataReader.GetFieldType(2) returned null.


The trick is to reference `Microsoft.SqlServer.Types` of a sufficiently high version.

I added a reference to the nuget package `Microsoft.SqlServer.Types` (version 14.0)

When the package is added, it displays a helper piece of html like this:



> Action required to load native assemblies
> 
> To deploy an application that uses spatial data types to a machine that does not have 'System CLR Types for SQL Server' installed you also need to deploy the native assembly SqlServerSpatial140.dll. Both x86 (32 bit) and x64 (64 bit) versions of this assembly have been added to your project under the SqlServerTypes\x86 and SqlServerTypes\x64 subdirectories. The native assembly msvcr120.dll is also included in case the C++ runtime is not installed.
> 
> You need to add code to load the correct one of these assemblies at runtime (depending on the current architecture).
>
> ASP.NET Web Sites
>
> For ASP.NET Web Sites, add the following block of code to the code behind file of the Web Form where you have added Report Viewer Control:

    Default.aspx.cs:
        
    public partial class _Default : System.Web.UI.Page
    {
        static bool _isSqlTypesLoaded = false;

        public _Default()
        {
            if (!_isSqlTypesLoaded)
            {
                SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~"));
                _isSqlTypesLoaded = true;
            }
            
        }
    }

> ASP.NET Web Applications
> 
> For ASP.NET Web Applications, add the following line of code to the Application_Start method in Global.asax.cs:

    SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));

> Desktop Applications
>
> For desktop applications, add the following line of code to run before any spatial operations are performed:

    SqlServerTypes.Utilities.LoadNativeAssemblies(AppDomain.CurrentDomain.BaseDirectory);

	
	
As instructed I added:

	SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));

To `application_start` in Global.asax.cs

But here's the trick....

It didn't work! That is, it didn't work until I added this to `Web.Config`'s `runtime/assemblyBinding` element:

	<dependentAssembly>
		<assemblyIdentity name="Microsoft.SqlServer.Types" publicKeyToken="89845dcd8080cc91" culture="neutral" />
		<bindingRedirect oldVersion="10.0.0.0" newVersion="14.0.0.0" />
	</dependentAssembly>
	
Also, once it did work, it would *fail* if I added this to the connection string:

	;Type System Version=SQL Server 2012;

(Which is one of the random pieces of advice out there)

Enjoy!

# References

* [Stackoverflow: DataReader.GetFieldType returned null](https://stackoverflow.com/questions/6569624/datareader-getfieldtype-returned-null)

