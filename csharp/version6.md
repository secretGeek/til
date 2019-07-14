# C# version 6 

See [what's new in C#6](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-6)

## readonly auto props

You can have properties that can be gotten but cannot be set:

		public string FirstName { get; }
		public string LastName { get; }

Wait! What? Then how do they ever get set!? Are they like a one way street out of a deadend ? 

Answer: They can only be set in the constructor....

	public class Person
	{
		public string FirstName { get; }
		public string LastName { get; }

		public Person(string firstName, string lastName)
		{
			if (string.IsNullOrWhiteSpace(firstName) || string.IsNullOrWhiteSpace(lastName))
				throw new ArgumentException("Must set first and last name");
			FirstName = firstName;
			LastName = lastName;
		}
	}

	void Main()
	{
		var person = new Person ("Jack","");
		//ArgumentException: Must set first and last name
		person.Dump();
	}

(Note this example from [microsoft documentation](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-6#read-only-auto-properties) commits one or more of the [Falsehoods Programmers Believe About Names](https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/))

You may be wondering... what if the constructor *doesn't* set those properties? For example, what if there's two or more constructors and some of them just forget to set the property. Do you get an exception? Nope. In that case the property just remains null.

What if a different method tries to set the property? 

Then you receive this compiler error:

	Property or indexer 'Person.FirstName' cannot be assigned to -- it is read only

I've shared a [fuller version of example above at share.linqpad](http://share.linqpad.net/npxbjk.linq)

## auto-property initializers

These are very cool.

The examples above show how readonly properties can be initialized in a constructor.

But some properties don't need to be initialized from a parameter, you just want to set them to a sensible default (example to follow).

And if you have many such properties, or if you have many constructors, it is cumbersome to ensure that every variables was correctly initialized via every constructor.

Enter auto-property initializers.

You can initialize the properties underlying value right where the property is defined....

	public class Person
	{
		public IEnumerable<Problem> Problems { get; } = new List<Problem>();

^ In the above class, even if there were fifty constructors, none of them would need to think about initializing that property.

And you can mix this with using constructors to perform initialization, from parameters even, if you wish. Constrast these three techniques being used in one class....

	public class Person
	{
		public IEnumerable<Problem> Problems { get; } = new List<Problem>();

		public Person()
		{
		}

		public Person(string firstName)
		{
			FirstName = firstName;
			Problems = new List<Problem>() { new Problem() };
		}

		public Person(IEnumerable<Problem> problems)
		{
			Problems = problems;
		}

If the class above is instantiated in three different ways, there will be a different number of problems each time:

	(new Person()).Problems.Count().Dump();
	// 0 Problems
	(new Person("Jack")).Problems.Count().Dump();
	// 1 Problem
	(new Person(new List<Problem> { new Problem(), new Problem()})).Problems.Count().Dump();
	// 2 Problems

As before, I've put a [more complete example of Auto Property Initializers](http://share.linqpad.net/j2u6jm.linq) online via Linqpad Sharing.

## expression-bodied function members

Did you like those last two features? Well the language-feature-fairies did not stop giving us gifts at that point. They took it even further.

Imagine you have a simple method, that can be written as one expression. Here's an example:

	public string FriendlyName() 
	{
		return FirstName + " " + LastName;
	}

(And of course with Linq... we can have extremely complex pieces of code that are still just one expression.)

This single-expression method can be expressed (pun-intended) as an expression bodied function.

	public string FriendlyName() => FirstName + " " + LastName;

... the syntax should be recognisable from expression lambdas, and from javascript arrow functions.

(You can add parameters as well...)

	public string FriendlyName(string title) => title + " " FirstName + " " + LastName;


If you have *no* parameters, you may as well write a property instead of a method....

	public string FriendlyName => FirstName + " " + LastName;

Two characters saved! (They `()`.)

These remove a lot of 'ceremony'. Nice.

## using static

This is nifty too.

Instead of peppering your code like this....

	Console.BackgroundColor = ConsoleColor.Red;
	Console.ForegroundColor = ConsoleColor.Blue;
	Console.WriteLine("Console console console");

You can remove all those excess `Console`s by importing the static class, by adding:

	using static System.Console;

...amongst the namespace imports.

Then your code is more simply:

	BackgroundColor = ConsoleColor.Red;
	ForegroundColor = ConsoleColor.Blue;
	WriteLine("Press F4 and see 'static System.Console'...");

...and the members of System.Console are first class.

While Console is one of the most fun static classes, you can also do this for any class with static members, including your own static or non static classes, if they have static members.

And there are many members on `string` that are worth using, but note that this doesn't work:

    using static string;

You need to use the real name:

    using static System.String;

...and you get firstclass access to `Join`, `IsEmptyOrWhiteSpace` and all your other friends.

**But what if** there are two WriteLine methods.... a local one, and one you've imported?

The code will compile, there will be no warning, and the local method will be used.

**But what if** there are two WriteLine methods.... both imported via two different `using static` declarations?

Then there will be a compiler error, something like:

	The call is ambiguous between the following methods or properties: 'System.Console.WriteLine(string)' and 'UserQuery.MyOwnClass.WriteLine(string)'

**How do you do it in LinqPad?

"using static" in Linqpad is a bit different because namespaces are imported via the Query properties (`F4`).

To do this in Linqpad, press F4 and enter

	static System.Console

...for example.

(Source: [LinqPad forum](https://forum.linqpad.net/discussion/1754/using-static-support))

And if it's a local static class, you need to give its fully qualified name, which starts with `UserQuery`, e.g. `static UserQuery.MyOwnClass`




## null conditional operators

I've said previously that statements like this are basically `NullReferenceException` generators:

    return Person.Manager.Manager.Employees[3].Manager.Name;

And you'd be better of cutting this down to just:

    throw new NullReferenceException();


...because somewhere in that chain of reasoning, some assumption will fail and it will all blow up.

The remedy has previously been to write many lines of guarded clauses, asking effectively:

    if person has a manager and that person's manager has a managers, and that person's manager's manager has employees and that person's manager's manager's manager's number of employees is at least 4, and that perons' manager's manager's 4th employee has a manager then return that perons' manager's manager's 4th employee's manager's name.

(Or put it in a try catch nullref... and that gets ugly too)

The mechanical nature of all these kinds of checks implies that a "sufficiently advanced" compiler could do all the work for us.

Well check out this ugly looking but wonderfully powerful construct... the null conditional operator!

    return Person?.Manager?.Manager?.Employees[3]?.Manager.Name;

This will return *either* the result you're after, *or* `null`.

My inner grammarian hates the "question dot" ... i start twitching just seeing it... and I have trouble remembering whether it's the question mark or the dot that comes first... but I love what it does, so I'm conflicted.

Commonly it is combined with a coalescing operator, like this:

    return Person?.Manager?.Manager?.Employees[3]?.Manager.Name ?? "Unknown";

Know it. Use it. Love it.


## string interpolations

## exception filters

## the nameof expression

## await in catch and finally blocks

## index initializers

## extension methods for collection initializers

## improved overload resolution

## deterministic compiler option
