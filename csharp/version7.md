# C# version 7 

See [what's new in C#7](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-7)

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

You can give names to the member of a Tuple, and are no longer stuck with the ghastly `Item1` etc.

Previously:

	(string, string) myTuple = ("a", "b");
	Console.WriteLine(myTuple.Item1); //a
	Console.WriteLine(myTuple.Item2); //b

Now:

	(string a, string b) myTuple2 = ("a", "b");
	Console.WriteLine(myTuple2.a); //a
	Console.WriteLine(myTuple2.b); //b

And it's optional... you can name just some, or name them all, or name none....

	(string, string b) myTuple3 = ("a", "b");
	Console.WriteLine(myTuple2.Item1); //a
	Console.WriteLine(myTuple2.b); //b


Note that the names used in place of `Item1`, `Item2` etc, only exist at compile time. They are not preserved... if you use reflection to inspect them at runtime they will have turned back into Item1 etc.

In LinqPad if you dump a Tuple you'll see its members are named `Item1` etc.

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


## Discards

## Pattern matching

## ref local and return

## Local functions

## more expression-bodied members

## throw expressions

## Generalized async return types

## Numeric literal syntax improvements
