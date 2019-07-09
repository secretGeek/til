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


## auto prop initializers



## expression bodied function members

## using static

## null conditional operators

## string interpolations

## exception filters

## the nameof expression

## await in catch and finally blocks

## index initializers

## extension methods for collection initializers

## improved overload resolution

## deterministic compiler option
