# Error in Razor\Views\...\*.g.cshtml.cs page

Sometimes, particularly after upgrading from one .net core verison to another I see errors in `g.cshtml.cs` pages...


	Severity	Code	Description	Project	File	Line	Suppression State
	Error	CS0246	The type or namespace name 'VerifyCodeViewModel' could not be found (are you missing a using directive or an assembly reference?)	mysite	C:\apps\websites\mysite\obj\Debug\netcoreapp2.1\Razor\Views\Account\VerifyCode.g.cshtml.cs	23	Active

I can never remember what to do.

The trick is to go and look at the `cshtml` file (the razor view itself) that the `.cs` file is compiled from.

There will be an error and it will be evident in the cshtml file itself.

For some of them the error was that I had to add another `@using` statement to the `_ViewImports.cshtml` file. But it could be anything.

