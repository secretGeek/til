# Adding http_proxy to nuget config

I couldn't build a project locally because it wouldn't restore its nuget packages and kept receiving this error message:

> Unable to load the service index for source https://api.nuget.org/v3/index.json.

The secret was to add the proxy information to this file:


	> cd $env:appdata\nuget
	> n NuGet.Config


(Also known as `%appdata%\nuget\NuGet.Config`)


And add the `config` element shown below:


	<?xml version="1.0" encoding="utf-8"?>
	<configuration>
	  <packageSources>
		<add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
	  </packageSources>
	  <config>
		<add key="http_proxy" value="http://YOUR_PROXY:8080" />
	  </config>
	</configuration>

Then restart visual studio. Right click the solution and choose "Restore Packages".

This change can also be effected at the commandline, by running a "Developer Command Prompt for VS 2017" and there-in typing:

	nuget config -set http_proxy=http://YOUR_PROXY:8080



If you don't want to add it for all solutions you can allegedly just add a `http_proxy` to the local `nuget.config` within your solution.

## References

 * [SO: NuGet Behind Proxy](https://stackoverflow.com/questions/9232160/nuget-behind-proxy)
 * [NuGet.Config reference](https://docs.microsoft.com/en-us/nuget/schema/nuget-config-file)