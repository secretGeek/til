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

...my favored answer there is a lengthy one, but it provides a rationale as well: https://stackoverflow.com/a/42660356

Examples:

* `IList<T>` is invariant.

This means a method that accepts a parameter `IList<Feline>` will only accept exactly that. It won't accept `IList<Tiger>` (more derived) and it won't accept `IList<Object>` less derived.

Meanwhile:

* `IEnumerable<T>` is covariant because it is defined as `IEnumerable<out T>`

This means a method that expects `IEnumerable<Feline>` will accept `IEnumerable<Feline>` or `IEnumerable<Tiger>` or `IEnumerable<HouseCat>` because these are more derived. It won't accept `IEnumerable<Object>` (less derived)

And conversely....

* `Action<T>` is contravariant because it is defined as `Action<in T>`

This means a method with a parameter that is `Action<Feline>` will accept `Action<Feline>` or `Action<Mammal>` (assuming Felines inherits from Mammal, inherits from Animal, inherits from Object) -- and will ALSO accept `Action<Animal>` and even `Action<Object>` but it will not accept a parameters of type `Action<HouseCat>` or a parameter of type `Action<Tiger>` because these are MORE derived.



## Embedded interop types

[Type equivalence and embedded interop types](https://docs.microsoft.com/en-us/dotnet/framework/interop/type-equivalence-and-embedded-interop-types)

If you publish a COM component, you no longer need to publish a primary interop assembly to be accessible from .net (unless you want it to be accessed from earlier versions)

Hard to summarise, and unless your publishing or using a lot of COM components, the nuances here are likely to escape you. I'm gonna skip going in great depth on this one.

