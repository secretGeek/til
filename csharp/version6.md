# C# version 6 

See [what's new in C#6](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-6)

**Table of contents**

* [readonly auto props](#readonly-auto-props)
* [auto-property initializers](#auto-property-initializers)
* [expression-bodied function members](#expression-bodied-function-members)
* [using static](#using-static)
* [null conditional operators](#null-conditional-operators)
* [string interpolations](#string-interpolations)
* [exception filters](#exception-filters)
* [the nameof expression](#the-nameof-expression)
* [await in catch and finally blocks](#await-in catch-and-finally-blocks)
* [index initializers](#index-initializers)
* [extension methods for collection initializers](#extension-methods-for-collection-initializers)
* [improved overload resolution](#improved-overload-resolution)
* [deterministic compiler option](#deterministic-compiler-option)


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

I've said [previously](http://www.secretgeek.net/cruel_compiler) that statements like this are basically `NullReferenceException` generators:

    return Person.Manager.Manager.Employees[3].Manager.Name;

And you'd be better off cutting this down to just:

    throw new NullReferenceException();

...because somewhere in that chain of reasoning, some assumption will fail and it will all blow up.

The remedy has previously been to write many lines of guarded clauses, asking effectively:

    if person has a manager 
	and that person's manager has a manager, 
	and that person's manager's manager has employees,
	and that person's manager's manager's
	number of employees is at least 4, 
	and that persons' manager's manager's 
	4th employee has a manager
	then 
	return that person's manager's 
	manager's 4th employee's manager's name.

(Or put it in a `try...catch (NullReferenceException...` and that gets ugly too)

The mechanical nature of all these kinds of checks implies that a "sufficiently advanced" compiler could do all the work for us.

Well check out this ugly looking but wonderfully powerful construct, added in C#6... the null conditional operator!

    return Person?.Manager?.Manager?.Employees[3]?.Manager.Name;

This will return *either* the result you're after, *or* `null`.

My inner grammarian hates the "question dot" ... i start twitching just seeing it... and I have trouble remembering whether it's the question mark or the dot that comes first... but I love what it does, so I'm conflicted.

Commonly it is combined with a coalescing operator, like this:

    return Person?.Manager?.Manager?.Employees[3]?.Manager.Name ?? "Unknown";

Know it. Use it. Love it.


## string interpolations

The old way:

	var thing = "World";
	Console.WriteLine(string.Format("Hello {0}", thing));

The modern way:

	var thing = "World";
	Console.WriteLine($"Hello {thing}");

To include a format specifier, the old way:

	var stars = 1.3f;
	Console.WriteLine(string.Format("I give it {0:F2} stars", stars));

Same as the new way really:

	var stars = 1.3f;
	Console.WriteLine($"I give it {stars:F2} stars");

Need to deal with different cultures? Implicitly convert formatted string to `FormattableString`, then specify the culture when performing a `.ToString(culture)` on that.

	//using System.Globalization
	FormattableString str = $"Today is {DateTime.Today}";

	Console.WriteLine(str.ToString(new CultureInfo("en-US")));
	//Today is 7/16/2019 12:00:00 AM

	Console.WriteLine(str.ToString(new CultureInfo("de-DE")));
	//Today is 16.07.2019 00:00:00

	Console.WriteLine(str.ToString(new CultureInfo("en-UK")));
	//Today is 7/16/2019 12:00:00 AM

Escaping is pretty important in strings... we know about "@" strings.... how do thye combine with "$" strings? The dollars come first. That's easy to remember.

	var path = $@"C:\Users\{userName}\Documents";

TO output literal squiggly brackets... double them...

	$"I like squiggles {{}}".Dump();
	//I like squiggles {}

Otherwise you'll get "Expected expression", or a self-explanatory message like "A '}' character must be escaped (by doubling) in an interpolated string."


Because this format can already contain ':' chars, e.g. {name:F2} -- it presents a challenge when you want to use a ternary expression ( e.g "a >  b ? a : b") -- and the solution is to put the expression inside parentheses:

	Console.WriteLine($"The winner is: {(a > b ? PersonA : PersonB)}");


Many more details at [this tutorial](https://docs.microsoft.com/en-us/dotnet/csharp/tutorials/string-interpolation)

C# has needed this for a long time, I use it every chance I get. Here's ancient articles wishing for it: [previously](http://www.secretgeek.net/string_templating) and [phil haack 10years earlier](https://haacked.com/archive/2009/01/04/fun-with-named-formats-string-parsing-and-edge-cases.aspx/)


## exception filters

This is a special new piece of syntax... a 'when' statement that can follow a catch -- 

Instead of catching *every* exception of the given type, you can add a "when filter" so the exception handler will only catch exceptions that are:

1. of the expected type (or derivation of.)
2. match the "when filter" condition.

Show don't tell --

	catch (Exception ex) when (ex.Message.ToLowerInvariant().Contains("idea"))
	{
		Console.WriteLine("Something about ideas...");
	}
	catch (Exception ex)
	{
		Console.WriteLine("Something else");
	}


Note that the when filter:

1. can refer to the exception variable (`ex` above)
2. can also refer to any other stuff it wants to...

e.g.

	catch (Exception) when (DateTime.Now.Hour < 12)
	{
		Console.WriteLine("I love the smell of freshly caught exceptions in the morning.");
	}


## the nameof expression

Don't do this (anymore)....


	public void KillPerson(string name) {
		if (string.IsNullOrWhiteSpace(name)) {
			throw new ArgumentNullException("name");
		}

...If you change the 'name' parameter or misspell the "name" string, the compiler wouldn't notice the inconsistency.

Instead, with the awesome power of `nameof`


	public void KillPerson(string name) {
		if (string.IsNullOrWhiteSpace(name)) {
			throw new ArgumentNullException(nameof(name));
		}

No more margin for error!

Ideally you'd use this in any place where you currently hard code the name of any symbol as a string.


Consider:

* all the other Argument Exceptions Types
  * ArgumentException
  * ArgumentOutOfRangeException
* Logging the current method, a variable etc.
* Code in MVC Views that mention:
  * Action Name
  * Controller Name (this is a questionable, see below)
  
 
### Logging example with `nameof`

    Console.WriteLine($"{nameof(i)} == {i}");

...and the "Caller info attributes" introduced in version 5 can be used for more context.


### ActionName and ControllerName examples with `nameof`

How can we remove the hard coding from this example?

    @Html.ActionLink("Add sale", "Create", "Purchase") 


Instead of "Create" we can use 

    `nameof(PurchaseController.Create)`

(We may need to add using statement or specify the controller's namespace in a `_ViewImports.cshtml`)

But the controller is the real issue. The challenge is that 'Purchase' indicates the type `PurchaseController`. Instead of "Purchase" we're forced to use something like....


	nameof(PurchaseController).Substring(0, nameof(PurchaseController).LastIndexOf("Controller"))

...and you could hide a lot of that work behind a helper method, but nah, I can't see it being worthwhile at all, it's just bad. It introduces more code and more room for mistakes.


## await in catch and finally blocks

Previously, you couldn't stick an [`await`](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/await) just anywhere... one particular example is that you could not place an `await` in a catch or finally expression.

If this ruined your life, then I have some amazing news (from a year or two back). As of C# version 6, you can also place `await` in catch and finally blocks.

The example given in documentation is about logging. You may still want your return to happen "now". But you may fire off some log messages asynchronously.

As always, writing code in catch and finally blocks is something you need to do sparingly and thoughtfully, particularly as regards code that risks throwing its own exceptions, as any current exception will be lost and/or any cleanup activities may not be completed.




## index initializers

## extension methods for collection initializers

## improved overload resolution

## deterministic compiler option
