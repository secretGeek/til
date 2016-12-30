# Adding Nuget reference to Json.net errored with "'Newtonsoft.Json' already has a dependency defined for 'Microsoft.CSharp' in Visual Studio 2010


Solution was to run this...

    Install-Package Newtonsoft.Json -Version 8.0.3

No online help was very helpful.

