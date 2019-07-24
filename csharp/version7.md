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




Further reading on [tuples in c#7](https://docs.microsoft.com/en-us/dotnet/csharp/tuples)


## Discards

## Pattern matching

## ref local and return

## Local functions

## more expression-bodied members

## throw expressions

## Generalized async return types

## Numeric literal syntax improvements


## Source

* [what's new in C#7](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-7)
