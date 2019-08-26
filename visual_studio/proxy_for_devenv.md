# Setting/Overriding the proxy for visual studio (devenv.exe)

Because of the corporate network being dumb i found i had to specify the proxy that devenv uses.

To do this I edited the `devenv.exe.config` file (as an administrator)


That file was here for me:

		C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\ide\devenv.exe.config


First I added this:

    
     <system.net>
      <defaultProxy useDefaultCredentials="true" enabled="true">
        <proxy usesystemdefault="True" />
      </defaultProxy>
      <settings>
        <ipv6 enabled="true"/>
      </settings>
    </system.net>

(Inside `<configuration>`)

It didn't seem to help much.

Then I made it:

    <system.net>
      <defaultProxy useDefaultCredentials="true" enabled="true">
        <proxy bypassonlocal="true" proxyaddress="http://PROXYADDRESS:8080" />
      </defaultProxy>
      <settings>
        <ipv6 enabled="true"/>
      </settings>
    </system.net>


...where PROXYADDRESS is the actual address of the company's proxy.

And it worked thereafter.

The Cookiecutter plugin for example started to fetch data succesfully.

nuget required a nuget proxy setting. (Perhaps if i'd done this first then nuget would've worked fine?)

