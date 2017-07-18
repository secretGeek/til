# Load DataTable from a SQL query


	private DataTable LoadTable(string connectionString, string sql)
	{
		DataTable dt = null;
		using (var connection = new SqlConnection(connectionString))
		{
			connection.Open();
			using (var sqlCommand = new SqlCommand(sql, connection))
			{
				var data = new DataSet();
				using (var da = new SqlDataAdapter(sqlCommand))
				{
					da.Fill(data);
				}

				dt = data.Tables[0];
			}
		}
		
		return dt;
	}


The nearest equivalent using Dapper would be something like this:


	private IEnumerable<T> Load<T>(string connectionString, string sql)
	{
		using (var connection = new SqlConnection(connectionString))
		{
			connection.Open();
			return connection.Query<T>(sql);
		}
	}

	
Also with Dapper, here's a tiny little wrapper for performing inserts/updates:

	private int Execute<T>(string connectionString, string sql, T parameters)
	{
		using (var connection = new SqlConnection(connectionString))
		{
			connection.Open();
			return connection.Execute(sql, parameters);
		}
	}

...which could be used like this:

	var updateSql = "update [Person] SET LastName = @LastName, FirstName = @FirstName, DOB=@DOB WHERE ID = @ID";
	var insertSql = "INSERT INTO [Person] ([DOB],[LastName],[FirstName]) VALUES (@DOB,@LastName,@FirstName)";
	if (person.ID == null)
		Execute(connectionString, insertSql, person);
	else
		Execute(connectionString, updateSql, person);

