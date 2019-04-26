# Data Table to CSV


Convert an array of objects to CSV is one of the classic activities.

Here's a workable method for converting a `System.Data.DataTable` to CSV.

	public static string ToCsv(this DataTable table, string fieldSeparator = ",", string recordSeparator = "\r\n", string fieldQualifier = "\"")
	{
		var result = new StringBuilder();
		for (int i = 0; i < table.Columns.Count; i++)
		{
			var tableName = table.Columns[i].ColumnName;
			result.Append(EscapeAndQualifyAsNeeded(tableName, fieldSeparator, recordSeparator, fieldQualifier));
			result.Append(i == table.Columns.Count - 1 ? recordSeparator : fieldSeparator);
		}

		foreach (DataRow row in table.Rows)
		{
			for (int i = 0; i < table.Columns.Count; i++)
			{
				string value;
				if (row[i] is System.DateTime)
				{
					value = string.Format("{0:yyyy-MM-dd HH:mm:ss}", row[i]);
				}
				else
				{
					value = row[i].ToString();
				}

				result.Append(EscapeAndQualifyAsNeeded(value, fieldSeparator, recordSeparator, fieldQualifier));
				result.Append(i == table.Columns.Count - 1 ? recordSeparator : fieldSeparator);
			}
		}

		return result.ToString();
	}

	public static string EscapeAndQualifyAsNeeded(string value, string fieldSeparator = ",", string recordSeparator = "\r\n", string fieldQualifier = "\"") 
	{
		if (value.Contains(fieldSeparator) || value.Contains(recordSeparator) || value.Contains(fieldQualifier) || value.StartsWith(" ") || value.EndsWith(" "))
		{
			value = fieldQualifier + value.Replace(fieldQualifier, fieldQualifier + fieldQualifier) + fieldQualifier;
		}

		return value;
	}

...The bit I care about is the `EscapeAndQualifyAsNeeded` method.

Common mistakes people make are:

1. Don't do any escaping or qualifying and end up with unparseable CSV.
2. Qualify *every* field, whether it needs to be qualified or not.
3. Trim fields before qualifying. That's changing the data, and should only be done if its explicitly needed. (Some people hide steganographic codes in trailing whitespace... this would eradicate the message.)     	 		     
4. Only check for embedded fieldSeparators, don't check for embedded record separators, etc.


### Sponsor
    
Love CSV? Hate CSV? Try [NimbleText](http://NimbleText.com/) for your CSV transforming needs.

## External link:


 * [Falsehoods programmers believe about CSVs](https://donatstudios.com/Falsehoods-Programmers-Believe-About-CSVs)