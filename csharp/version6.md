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
* [await in catch and finally blocks](#await-in-catch-and-finally-blocks)
* [index initializers](#index-initializers)
* [extension `add` methods for collection initializers](#extension-add-methods-for-collection-initializers)
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

This is very useful. For example you might reduce a simple controller to a bunch of one liners...

    public class HomeController : Controller
    {
        protected readonly IDAL DAL;
        public HomeController(IDAL dal) => this.DAL = dal;
        public IActionResult Index() => View(DAL.GetNews());
        public IActionResult About() => View();
        public IActionResult Error() => View();
    }

Much less ceremonial typing than:

	//
	// POST: /Home/About
	public IActionResult About()
	{
		return View();
	}

...for each of these anemic methods.



Also, in somes case if you have *no* parameters, you may as well write a property instead of a method....

	public string FriendlyName => FirstName + " " + LastName;

Two characters saved! (The `()`.)


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


Wait... there's an bug in the above. I don't want to rewrite it... just to say:

The null conditional won't help with `ArgumentOutOfRangeException` or with `KeyNotFoundException` -- as kind of implied by the description above.

The part where I say

> number of employees is at least 4

...is talking about an `ArgumentOutOfRangeException`.... that would still occur!

This is not protected from at all by the null conditional operator. They'd need to invent an "index conditional operator".. and this ain't one.

If you write:

	var x = manager?.Employees?[3]?.Name ?? "Unknown";

That means:

	If the manager is not null
	and the manager's employees is not null,
	take the 4th employee (this could throw)
	and if they have a name, take the name...
	...in any other case return null.

Similarly for a dictionary...

	var x = manager?.Employees?["Sue"]?.Name ?? "Unknown";

...if employees is null, you're safe.. but if employees are not null, and there is *no* employee named "Sue", you'll get a `KeyNotFoundException` and need to instead use some kind of safety-first extension method on `IDictionary<K,V>` ... 

So it's easily avoided by creating an extension method but it is not avoided by syntax sugar baked into the language as I inadvertently implied.



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

Here's my nutshell of what's happening here....

Look at this ugly old ridiculous syntax for ancient C# versions prior to 6...

	var messages = new Dictionary<int, string>
	{
		{ 404, "Page not Found"},
		{ 302, "Page moved, but left a forwarding address."},
		{ 500, "The web server can't come out to play today."}
	};

What's happening here is that items are being added to the dictionary and one must know that the first param is the key and subsequent params are the value. It's cumbersome.

Try this amazing new syntax on for size...


    var webErrors = new Dictionary<int, string>
	{
		[404] = "Page not Found",
		[302] = "Page moved, but left a forwarding address.",
		[500] = "The web server can't come out to play today."
	};


Now initializing the items is consistent with the way the items are accessed.

I tried to make a more interesting example, that shows a little more versatility and how the index initialization can be used (or misused?)

Given classes like this....

	class Population
	{
		public Dictionary<string, Person> Citizens { get; } = new Dictionary<string, Person>();
		public Person this[string name] { set => Citizens.Add(name, value); }
		public string this[string name, int age] { set => Citizens.Add(name, new Person(name, age)); }
	}

	class Person
	{
		public string Name { get; }
		public int Age { get; }
		public Person(string name, int age)
		{
			Name = name;
			Age = age;
		}
	}

We can initialize a new population like so:

	var pop = new Population {
		["fred"] = new Person("fred", 100),
		["jack", 12] = "fred"
	};



## extension `Add` methods for collection initializers


Collection initializers are the syntax that lets you declare the starting members of a collection, such as:

	var population = new List<Person> {
		new Person { Name = "Sally" },
		new Person { Name = "Vera" },
		new Person("Jenny")
	};



...and here's another existing (pre C#6) feature, that you need to understand before you understand this new feature....


If your collection type has an add method, it will be magically wired up for you. Let me demonstrate, using a custom collection type.


	public class Population : IEnumerable<Person>
	{
		private List<Person> innerPop { get; } = new List<Person>();
		public IEnumerator<Person> GetEnumerator() => innerPop.GetEnumerator();
		IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();

		// Three different 'Adds' we'll use in our initializer syntax...
		public void Add(Person p) => innerPop.Add(p);
		public void Add(string name) => innerPop.Add(new Person(name));
		public void Add(string firstName, string lastName) => innerPop.Add(new Person($"{firstName} {lastName}"));
	}


Notice that the class above is a kind of wrapper over a `List<Person>` and it has three different `Add` methods.

(And the class is quite short thanks to expression-bodied members, and auto-property initializers)

 We can get the initializer syntax to "hook up" with those Add methods... Add is *special* you see, as far as the compiler is concerned.

	var pop = new Population {
		new Person("Fred"),
		"Jack",
		{"Jimbo","Jones"}
	};


The code above uses the 3 different Add methods (in turn).

With c#6 you can also use extension methods to extend existing collection types with *new* "Add" methods, which will be "hooked up" by initializers, if needed.

For example, let's extend dictionary...


	public static class DicExtensions
    {
        public static void Add(this Dictionary<int, string> dic, int i)
        {
            dic.Add(i, "Number " + i.ToString());
        }

        public static void Add(this Dictionary<int, string> dic, int i, string separator, params string[] strings)
        {
            dic.Add(i, string.Join(separator, strings));
        }
    }

	var dic = new Dictionary<int, string> { 3, 4, 5 };


| Key | Value |
|-----|-------|
| 3   | Number 3 |
| 4   | Number 4 |
| 5   | Number 5 |


	var d2 = new Dictionary<int, string> {
		{1," sweet ","Hello","World","!"},
		{2," cruel ","Goodbye","World","Goodbye"},
	};


| Key | Value |
|-----|-------|
| 1   | Hello sweet World sweet ! |
| 2   | Goodbye cruel World cruel Goodbye |


...and hence you can do the same with `Add` methods whether they are extension methods or not.


## improved overload resolution


Previously:

> some method calls involving lambda expressions


...were not implicitly resolved, and you'd need to be more explicit to avoid ambiguity.


But now... times have changed and:

> some method calls involving lambda expressions

*are* implicitly resolved.


I for one will be sleeping soundly tonight.

I've dug into the specific scenario here, and will reproduce it verbatim...


In C# < 6, calling a method such as this method:

	static Task DoThings()
	{
		 return Task.FromResult(0);
	}

...via syntax like this:


	Task.Run(DoThings);

...which relies on what's called the "Method Group" syntax (introduced in c# 2 to simplify using delegates, i think)

...would not work. And you'd need to use this more ceremonial approach...


	Task.Run(() => DoThings());

...i.e. a "Full Lambda" with more parens than a lisp professor.

But now times have changed and you can simply say:


	Task.Run(DoThings);

...confident in the knowledge that the compiler will be happy, you will be happy, everyone will be happy, and the things to be done will be done.









## deterministic compiler option


The compiler now has a `-deterministic` option to make sure that successive builds reuse the same guids and timestamp from one compilation to the next, so you can perform byte-for-byte comparison with more consistency, and less risk of helping humanity race toward the guid-apocalypose.

I'm not likely to need this option, so I am not committing this to memory.