# C# version 7


 * [out variables](#out-variables)
 * [Tuples](#tuples)
 * [Discards](#discards)
 * [Pattern matching](#pattern-matching)
 * [ref local and return](#ref-local-and-return)
 * [Local functions](#local-functions)
 * [more expression-bodied members](#more-expression-bodied-members)
 * [throw expressions](#throw-expressions)
 * [Generalized async return types](#generalized-async-return-types)
 * [Numeric literal syntax improvements](#numeric-literal-syntax-improvements)


## out variables

There is a tiny change that you will use every time you need an `out` variable in C#7 onward.

Previously, to use an `out` variable (when calling a method you used an `out` parameter) you would end up writing code like this:

	int result; //variable name and type are declared here, but not initialized...

	if (int.TryParse(input, out result)) // "result" is initialized here...
		Console.WriteLine(result);
	else
		Console.WriteLine("Could not parse input");

Which is ugly and terrible. Generally you want to have the habit of initializing a variable when it is set, but not so for `out` variables (in the old world...). And generally I declare local variables with `var` -- but not so here.

Hence, they've come up with this syntax...

	if (int.TryParse(input, out int result)) // variable "result" has name, type and value set right there.
		Console.WriteLine(result);
	else
		Console.WriteLine("Could not parse input");

It's still a bit awkward, being different from every other variable declaration, as well as not taking advantage of type inferencing. But there are other mitigating points we'll get to in subsequent features.


## Tuples


There's a new type of Tuple. And we are no longer stuck with the ghastly `Item1` etc.


You can declare the new type like so:

    var myTuple = ("a","b");
	Console.WriteLine(myTuple.Item1); //a
	Console.WriteLine(myTuple.Item2); //b


Or if you want to be more explicit about the types...

	(string, string) myTuple = ("a", "b");
	Console.WriteLine(myTuple.Item1); //a
	Console.WriteLine(myTuple.Item2); //b

And here's the nice thing... if you want to name the members (`a` and `b` in this example)...


	(string a, string b) myTuple2 = ("a", "b");
	Console.WriteLine(myTuple2.a); //a
	Console.WriteLine(myTuple2.b); //b

And it's optional... you can name just some, or name them all, or name none....

	(string, string b) myTuple3 = ("a", "b");
	Console.WriteLine(myTuple2.Item1); //a
	Console.WriteLine(myTuple2.b); //b

Or, if you prefer `var`....


	var t = (a: "a", b: "b");
	Console.WriteLine(t.a); //a
	Console.WriteLine(t.b); //b



Note that the member names (used in place of `Item1`, `Item2` etc) **only exist at compile time**. They are not preserved... if you use reflection to inspect them at runtime they will have turned back into Item1 etc.

e.g. in LinqPad if you dump a Tuple you'll see its members are named `Item1` etc.

	(string a, string b) myTuple2 = ("a", "b");
	myTuple2.Dump();

| Name   | Value |
|--------|-------|
| Item 1 | a |
| Item 2 | b |


...but if you use 'nameOf' -- because it runs at compile time, it will return the names you used.


	(string a, string b) myTuple2 = ("a", "b");
	nameof(myTuple2.a).Dump(); //returns a, *not* Item1.

What type is this thing??

	myTuple2.GetType().ToString().Dump();
	System.ValueTuple`2[System.String,System.String]

Ah, see that? `ValueTuple`... this is a completely new type. The old tuples, `System.Tuple`, were *reference* types (objects, that needed to be allocated... the sort of thing that makes hardcore performance engineers spit "Keep your damn allocations off my hotpath!")

Tuples in F# are structs... so I'm guessing these play nicer with F# than `System.Tuple`... but i haven't looked.


Further reading on [tuples in c#7](https://docs.microsoft.com/en-us/dotnet/csharp/tuples)


## Discards

Sometimes when you call a function you don't care about the result. That's easy -- just don't assign it to anything.

But sometimes there is an `out` parameter and you're forced to declare a variable you don't want or need.
Or it might return a tuple and you only want some of the items. What to do, what to do! If you've seen F# any time in the past 10 years you know this is a common feature of functional programming. In F# (and I'm assuming in other ML variants?) they use `_` as the name of a variable they intend to ignore. The compiler ensures you don't try to do anything with that variable, and you can have as many `_`'s as you like.

Well C# has YOINKED this feature now too.


Imagine there is a `Delete` method, like this:


	void Delete(string fileName, out bool found)
	{
		found = false;
		if (File.Exists(fileName))
		{
			found = true;
			File.Delete(fileName);
		}
	}


...it returns true or false in that `out` parameter, depending on if it found a file to delete or not.

But as a caller you don't care if it found a file. You can ignore that parameter like this:

	Delete("MyFile.txt", out _);

I guess they used `_` because it is less typing than the semantically equivalent `¯\_(ツ)_/¯`


Say we call a method and it returns a `ValueTuple<string,string,string>` .... here's an example of declaring it....


	(string,string,string) MedalWinners(string eventName)
	{
		// It's not a very sophisticared method...
		// returning the same value for every event...

		return ("Jill","Sally","Jack");
	}


As the caller of this method, imagine that we only care about the second item. How do we discard the other two items? **EASY.**


	var (_, silverMedalist,_) = MedalWinners("300 meter bunny hop while balancing an egg");
	silverMedalist.Dump(); // result: "Sally"

Sorry Jack and Jill.

There are two other places you can use this. One is in [pattern matching](#pattern-matching) which I'll describe in the next section.

The other is like this... but I don't see it as a big win, it's just *consistent*....


Imagine some method that returns a value:

	string WhosOnFirst()
	{
		return "Who";
	}

Let's call that method but *ignore* the return value....


	_ = WhosOnFirst();

I guess it's more explicit than simply saying:

	WhosOnFirst(); // ... not assigning it at all.



## Pattern matching


Here is a common pattern that is crying out for some pattern matching....

The old "is/as"

	if (foo is string)
	{
		var bar = foo as string;
		bar.Dump("here is the value");
	}
	else
	{
		foo.Dump("it's not a string");
	}

The sort of place where you commonly see this is when parsing, or traversing tokens in a directed graph.


	if (token is Comment)
	{
		var comment = token as comment;
		EmitComment(comment);
	}
	else if (token is Terminator)
	{
		var term = token as Terminator;
		EmitTerminator(term);
	} ... etc...

And the first thing to see with pattern matching is that the "is-as" pattern is greatly simplified....


THIS:

	if (foo is string)
	{
		var bar = foo as string;
		bar.Dump("here is the value");
	}

...BECOMETH:

	if (foo is string bar)
	{
		bar.Dump("here is the value");
	}
	...

...note the syntax here is as we saw in `out` variables -- straight after the type, give it a name, and hey presto, the thing being discussed of the type being considered is assigned to the name provided. Pow!


Having cleaned up that little pattern, the syntax gets a lot niftier, and really earns the name pattern matching.

The type of code discussed above is a chain of "if" statements that resembles a switch statement, only you're switching on logic and types instead of simple values.

So switches "switch it up" a little and allow you to perform a whole slew of possibilities...





## ref local and return

## Local functions

## more expression-bodied members

## throw expressions

## Generalized async return types

## Numeric literal syntax improvements


## Source

* [what's new in C#7](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-7)
