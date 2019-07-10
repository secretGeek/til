# C# version 5

See [what's new in C#5](https://docs.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-version-history#c-version-50)

## Asynchronous members 

See [Asynchronous programming](https://docs.microsoft.com/en-us/dotnet/csharp/async) with the [Task Based Asynchronous Pattern](https://docs.microsoft.com/en-us/dotnet/standard/asynchronous-programming-patterns/task-based-asynchronous-pattern-tap)


You will come to know and love definitely not fear:

* The concepts of "I/O bound" versus "CPU-bound code"
* The classes `Task` and `Task<T>`.
* The keywords `await` and `async`.


> For I/O-bound code, you `await` an operation which returns a `Task` or `Task<T>` inside of an async method

and

> For CPU-bound code, you `await` an operation which is started on a background thread with the `Task.Run` method.

### CPU-Bound example:


Imagine we have a very expensive CPU-bound calculation, such as:

	private int CalculateFoo()
	{
		Thread.Sleep(3000);
		return 1;
	}

(Ideally it would be doing something intensely cool and mathematical instead of just sleeping. This is just a tribute to such code...)

How can we ensure our code stays responsive, even while we do such am *instense* calculation?

This is an example designed for linqPad...


	void Main()
	{
		var downloadButton = new Button() { Text = "Think Hard", Dock = DockStyle.Fill};

		downloadButton.Click += async (o, e) =>
		{
			((Control)o).Text = "About to Think:";
			((Control)o).Enabled = false;

			var t = Task.Run(() => CalculateFoo());

			((Control)o).Text = "Thinking.....";
			var i = await t;
			
			((Control)o).Text = "The answer is " + i;
			((Control)o).Enabled = true;
		};
		
		using(var f = new Form()) {
			f.Controls.Add(downloadButton);
			f.ShowDialog();
		}
	}


## I/O Bound code

Instead of doing something on our local CPU, perhaps we need to do something on someone else's machine (e.g. "in the cloud") or in a database, or on a disk, or by giving a printer some instructions to ignore.

In such cases we are no longer CPU bound but I/O bound.

How would that be done?

	void Main()
	{
		var downloadButton = new Button() { Text = "Think Hard", Dock = DockStyle.Fill};

		downloadButton.Click += async (o, e) =>
		{
			((Control)o).Text = "About to Think:";
			((Control)o).Enabled = false;

			var stringData = await _httpClient.GetStringAsync(url);

			// Do something with our data...
			Console.WriteLine(stringData);

			((Control)o).Text = "Downloaded.";
			((Control)o).Enabled = true;
		};
		
		using(var f = new Form())
		{
			f.Controls.Add(downloadButton);
			f.ShowDialog();
		}
	}

If the 'Do something with our data' was going to be a CPU-intensive operation... then we'd use the technique in the first example to handle it.

## Caller info attributes 


Well look at this!

By applying these attributes to some members you can have them magically populated with some info from the compiler....

This is a strange magic!

	void Main()
	{
		DoThing("Thing");
	}

	void DoThing(string message,
			[System.Runtime.CompilerServices.CallerMemberName] string memberName = "",
			[System.Runtime.CompilerServices.CallerFilePath] string sourceFilePath = "",
			[System.Runtime.CompilerServices.CallerLineNumber] int sourceLineNumber = 0)
	{
		message.Dump("Message");
		memberName.Dump("MemberName");
		sourceFilePath.Dump("SourceFilePath");
		sourceLineNumber.Dump("SourceLineNumber");
	}

([Shared online with linqpad query sharing....](http://share.linqpad.net/dul59u.linq))

This would've avoided a few NT1 errors back in T-S days.

* [Further Reading](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/caller-information)


