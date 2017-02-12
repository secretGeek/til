# CSV to IEnumerable<T> (or Array<T>) in Linqpad

This needs to be a simple activity, here it is:

Given a CSV (of Crime data) with header row like this:

	Offence Description,Start Date,End Date,Suburb,Postcode

For which I've had to manually create this POCO/DTO.

    public class Crime
    {
        public string Offence { get; set; }
        public DateTime? Start { get; set; }
        public DateTime? End { get; set; }
        public string Suburb { get; set; }
        public int? Postcode { get; set; }
    }


With a reference to Microsoft.VisualBasic.dll and namespace of:

    Microsoft.VisualBasic.FileIO
    System.Globalization

The load and convert to Array code is....

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

                crimes.Add(new {
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

    
    
A different approach is to use a library. I've tried two. Here's ServiceStack and LinqToCsv.

TODO: I'll put FileHelpers.net in here later if I get around to it. (Send a PR if you've got one)


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


(For more on this one see <http://www.aspnetperformance.com/post/LINQ-to-CSV-library.aspx#How_to_use>


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


## Source

    