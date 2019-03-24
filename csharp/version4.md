# C# Version 4 

See [what's new in C#4](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-version-history#c-version-40)

## Dynamic binding


A variable with Dynamic type can be assigned any type.

	dynamic f = 1;
	((object)f).Dump("F is an integer?");

	f = "F is a string";
	((object)f).Dump("F is a string NOW?");
	
Note that in Linqpad to dump a dynamic you can cast it to object.

A handy type in the `System.Dynamic` namespace is `ExpandoObject`


	dynamic idea = new ExpandoObject();
    idea.Who = "Me";
	idea.When = DateTime.Now;
	((object)idea).Dump();
	
(Again, cast to object to be able to dump in linqpad)


## Named/optional arguments


This is a bit of a contrived example, don't do this in production.

Given this method... note the default value supplied to some arguments... that makes those arguments optional:


	public void LogDetails(string message, ConsoleColor color = ConsoleColor.Gray, ConsoleColor bgColor = ConsoleColor.Black) {
		Console.ForegroundColor = color;
		Console.BackgroundColor = bgColor;
		Console.WriteLine(message);
		Console.ResetColor();
	}

We can specify just the first argument, omitting all the optional arguments:

	LogDetails("Hey");
	
We can omit just the last argument... 
 	
	LogDetails("Oh no!", ConsoleColor.Red);

To omit an argument in the middle, we need to use the naming feature:
	
	LogDetails("Exciting", bgColor: ConsoleColor.Magenta);

We can use naming to specify the arguments in whatever order we feel like specifying them....


	LogDetails(bgColor: ConsoleColor.DarkBlue, color: ConsoleColor.Yellow, message: "This is a message");


...but I would generally avoid that.



## Generic covariant and contravariant



See <https://stackoverflow.com/questions/2662369/covariance-and-contravariance-real-world-example>

## Embedded interop types
