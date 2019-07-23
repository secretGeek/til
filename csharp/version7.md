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

## Discards

## Pattern matching

## ref local and return

## Local functions

## more expression-bodied members

## throw expressions

## Generalized async return types

## Numeric literal syntax improvements
