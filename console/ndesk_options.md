#NDesk Options

Writing a console app?

I don't know if it's deprecated now or what but I still love ndesk options.

It's a single file that you drop in your console application, and then you can parse options joyfully.

Example from an early version of NimbleText.


    using Mono.Options; // Beautiful Console argument parsing!
    ...
    var p = new OptionSet() {
        { "d|rawdata=",         "the raw input data", v => settings.InputData = v},
        { "p|pattern=",         "the pattern", v => settings.InputPattern = v},
        { "i|inputdatafile=",   "a filename for loading the input data", v => settings.InputDataFile = v},
        { "s|pipeline",         "Stream input data via the pipeline", v => settings.Pipeline = v != null},
        { "f|patternfile=",     "a filename for loading a pattern", v => settings.InputPatternFile = v},
        { "r|rowdelim=",        "the row delimiter", v => settings.RowDelimiter = v},
        { "c|coldelim=",        "the column delimiter", v => settings.ColumnDelimiter = v},
        { "o|outputfile=",      "a filename to store the results", v => settings.ResultsFile = v},
        { "g|gui",              "show the Graphical User Interface", v => show_gui = v != null}, 
        { "?|h|help",           "show this message and exit", v => show_help = v != null },
    };

    try
    {
        unprocessedArgs = p.Parse(args);
    }

    
And to show help (display all options) -- it's as easy as:


    Console.WriteLine("Options:");
    p.WriteOptionDescriptions(Console.Out);
    
    
But in the common case that you're trying to detect that an invalid option was received, you might do this first.


    if (p.UnrecognizedOptions != null && p.UnrecognizedOptions.Count > 0)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.WriteLine("\r\nError. Unrecognized commandline option" + (p.UnrecognizedOptions.Count > 1 ? "s" : "") + ".");
        Console.ResetColor();
        foreach (var s in p.UnrecognizedOptions)
        {
            Console.Write("Unrecognized: ");
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine(s);
            Console.ResetColor();
        }
        Console.WriteLine("Please see below for all valid options.");
    }
