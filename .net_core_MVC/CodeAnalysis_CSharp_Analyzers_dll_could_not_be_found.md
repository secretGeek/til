# .nuget\packages\microsoft.codeanalysis.analyzers\1.1.0\analyzers\dotnet\cs\Microsoft.CodeAnalysis.CSharp.Analyzers.dll could not be found

This was frustrating and inexplicable (so far)

Asp.net core 2.1 project (that had been upgraded from 1.0) started to fail with:

	\.nuget\packages\microsoft.codeanalysis.analyzers\1.1.0\analyzers\dotnet\cs\Microsoft.CodeAnalysis.CSharp.Analyzers.dll 
	could not be found

There were online reports about the same problem, but I couldn't understand what they were talking about.

This had occurred completely spontaneously, as far as I could tell.

I searched the code base for any reference to

	"Microsoft.CodeAnalysis.CSharp" 

And the only one I found was in the file 

	"obj\project.assets.json"

Then I went and looked at another project of mine which did not have the same problem.

I found they differed only slightly in this partt of the assets file....

I made them identical. Then the problem went away.

The good one said:

    "Microsoft.CodeAnalysis.Analyzers/1.1.0": {
      "sha512": "HS3iRWZKcUw/8eZ/08GXKY2Bn7xNzQPzf8gRPHGSowX7u7XXu9i9YEaBeBNKUXWfI7qjvT2zXtLUvbN0hds8vg==",

The bad one said:

    "Microsoft.CodeAnalysis.Analyzers/1.1.0": {
      "sha512": "GM6h8wakaDLlszoxBZoqdDAs98bd0eu0qYjJX4nMEO6p05ZulUM1V5tXtaYRypGhe78bGci02ejvH4SAumYsKA==",


Another time I had this error and the assets file seemed to already have what I considered "the good one". In that case a "clean and rebuild" seemed to do the trick.



