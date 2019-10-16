# CSV to IEnumerable<T> (or Array<T>) in Linqpad

Loading a CSV file and turning it into an IEnumerable<T> needs to be a simple activity.

Below are five different implementations, all pretty simple. They use, in order

 * Microsoft.VisualBasic.dll
 * ServiceStack
 * LinqToCsv
 * FileHelpers.net
 * Powershell (Import-CSV)
 
 
Given a CSV (of crime data) with header row like this:

    Offence Description,Start Date,End Date,Suburb,Postcode

...and for which I've manually created a similar looking POCO/DTO.

    public class Crime
    {
        public string Offence { get; set; }
        public DateTime? Start { get; set; }
        public DateTime? End { get; set; }
        public string Suburb { get; set; }
        public int? Postcode { get; set; }
    }


## Using Microsoft.VisualBasic.dll to load a CSV file
    
Add a reference to `Microsoft.VisualBasic.dll` and namespaces of:

    Microsoft.VisualBasic.FileIO
    System.Globalization

The code to load and convert to List<Crime> code is....

    void Main()
    {
        var crimes = new List<Crime>();
        var au = new CultureInfo("en-AU");
        var skipped = false;
        using (var parser = new TextFieldParser(@"C:\Temp\Crime_Data.csv"))
        {
            parser.TextFieldType = FieldType.Delimited;
            parser.SetDelimiters(",");
            while (!parser.EndOfData)
            {
                string[] fields = parser.ReadFields();

                if (!skipped) {
                    // Skip header.
                    skipped = true;
                    continue;
                }

                crimes.Add(new crime {
                  Offence = fields[0],
                  Start 	 = fields[1] == "" ? (DateTime?)null : DateTime.ParseExact(fields[1], "yyyy-MM-dd HH:mm", au),
                  End 	 = fields[2] == "" ? (DateTime?)null : DateTime.ParseExact(fields[2], "yyyy-MM-dd HH:mm", au),
                  Suburb = fields[3],
                  Postcode = fields[4] == "" ? (int?)null : int.Parse(fields[4])
                });
            }
        }

        crimes.Dump();
        //Do whatever you really need to do, to Fight Crime etc.
    }

    
A different approach is to use a 3rd party library, imported via `nuget`. I've tried three. Here's ServiceStack, LinqToCsv and FileHelpers.net



## Using ServiceStack to load a CSV File

    void Main()
    {
        var fileName = @"C:\Temp\Crime_Data.csv";
        var crimes = File.ReadAllText(fileName).FromCsv<List<Crime>>();
        //Null end dates become  31/12/1899 2:00:00 PM (which is the type at GMT+0, when it is 1/1/1900 12:00 here)
        crimes.Dump();
    }

Requires the nuget package `ServiceStack.Text.Signed` and these namespaces:

    ServiceStack
    System.Runtime.Serialization

And this not-so Poco DTO...


    [DataContract]
    public class Crime
    {
        [DataMember(Name="Offence Description")]
        public string Offence { get; set; }
        [DataMember(Name="Start Date")]
        public DateTime? Start { get; set; }
        [DataMember(Name="End Date")]
        public DateTime? End { get; set; }
        [DataMember]
        public string Suburb { get; set; }
        [DataMember]
        public string Postcode { get; set; } //I could *not* get this to work as a nullable int.
    }

## Using LinqToCsv to load a csv file


(For more on this one see <http://www.aspnetperformance.com/post/LINQ-to-CSV-library.aspx#How_to_use>)


    void Main()
    {
        var fileName = @"C:\Temp\Crime_Data.csv";
        var crimes = new CsvContext().Read<Crime>(fileName);
        //Null end dates becomes: 31/12/1899 2:00:00 PM (which is the type at GMT+0, when it is 1/1/1900 12:00 here)
        crimes.Dump();
    }

Here's our annotated DTO...


    // Define other methods and classes here
    public class Crime
    {
        [CsvColumn(Name = "Offence Description")]
        public string Offence { get; set; }
        
        [CsvColumn(Name = "Start Date")]
        public DateTime? Start { get; set; }
        
        [CsvColumn(Name = "End Date")]
        public DateTime? End { get; set; }
        
        [CsvColumn(Name = "Suburb")]
        public string Suburb { get; set; }
        
        [CsvColumn(Name = "Postcode")]
        public int? Postcode { get; set; }
    }

    
## Using FileHelpers to read a csv file (from linqpad)

For more info see <http://www.filehelpers.net/example/QuickStart/ReadFileDelimited/>

    void Main()
    {
        var fileName = @"C:\Temp\Crime_Data.csv";
        //Null end dates becomes: 31/12/1899 2:00:00 PM (which is the type at GMT+0, when it is 1/1/1900 12:00 here)
        var crimes = new FileHelperEngine(typeof(Crime)).ReadFile(fileName);
        crimes.Dump();
    }

And here's our not-so-poco DTO. Note that we now have fields not properties. And we haven't specified names... their order is assumed to match the order of the file.
    
    [DelimitedRecord(",")]
    [IgnoreFirst()]
    public class Crime
    {
        //Offence Description,Start Date,End Date,Suburb,Postcode
        public string Offence;
        [FieldConverter(ConverterKind.Date, "yyyy-MM-dd HH:mm")]
        public DateTime? Start;
        [FieldConverter(ConverterKind.Date, "yyyy-MM-dd HH:mm" )]
        public DateTime? End;
        public string Suburb;
        public int? Postcode;
    }
    

## Powershell: Import-CSV    


Here's an example of using the Import-CSV commandlet from Powershell and then outputting the "End Date" property

    Import-CSV "C:\Temp\Crime_Data.csv" | % { $_."End Date" }

(This can be shortened to simply...)
    
    Import-CSV "C:\Temp\Crime_Data.csv" | % "End Date" 
    
Example of convert it into objects, sorting, and convert it back to csv for further processing

    Import-CSV "C:\Temp\Crime_Data.csv" | sort -d "Start Date" | convertto-csv -NoTypeInformation   


### Sponsor
    
Love CSV? Hate CSV? Try [NimbleText](http://NimbleText.com/) for your CSV transforming needs.

    
## Sources

 * [Linq To Csv](http://www.aspnetperformance.com/post/LINQ-to-CSV-library.aspx#How_to_use)
 * [FileHelpers read file delimited](http://www.filehelpers.net/example/QuickStart/ReadFileDelimited/)
 * [ServiceStack](http://docs.servicestack.net/csv-format) 

