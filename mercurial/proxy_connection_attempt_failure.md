# resolve: mercurial abort: error: A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond

When trying to pull from bitbucket while behind a corporate firewall i had this error:


> mercurial abort: error: A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond

Stackoverflow said I needed to configure a proxy.

Proxy settings are found here:

	Internet explorer > Internet options > Connections > LAN Settings

In the `Local Area Network (LAN) Settings` dialog... but proxy server was not specified, instead a `Use automatic configuration script` was specified.

I downloaded the script that was specified.

It was a lengthy javascript file (800 lines long), starting like this:

	function FindProxyForURL(url, host)
	{
		hostIP = dnsResolve(host);
		var tmpURL = url.substr(0,10);

		if(tmpURL.indexOf('://') == -1)
		{
				 url='http://' + url;
		}

Near the end it told you the general proxy settings to use....


	if (shExpMatch(url, "https://*"))
	{
		return "PROXY machinename1.adomain:8080; PROXY machinename2.adomain:8080;";
	}
	else
	{
		return "PROXY machinename1.adomain:8080; PROXY machinename2.adomain:8080;";
	}

(Names have been changed to protect the LAN)

So I took one of the addresses from there and put it into my [mercurial.ini](mercurial_ini.md) file like this:


	[http_proxy]
	host = machinename1.adomain:8080

Tried `hg in` again, and it now worked!

I am good at computers today.



## Source

 * [Configuration for using Mercurial with Bitbucket from behind a certificate rewriting proxy?](http://stackoverflow.com/questions/8991608/configuration-for-using-mercurial-with-bitbucket-from-behind-a-certificate-rewri)

## See also

 * []()