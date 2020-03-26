# Fix git push timed out with corporate proxy (e.g. visual studio .com)


## Problem:

Any commands like `git push` or  `git pull` or `git clone` were failing by timing out, while connected to the VPN.



	> git push
	fatal: unable to access 'https://exampleteamname.visualstudio.com/exampleprojectname/_git/examplereponame/': Failed to connect to exampleteamname.visualstudio.com port 443: Timed out


All 'work from home' developers started having this problem at the same time. We think it's related to the network/proxy, not something we can really fix.


## Work around

Disconnecting from vpn avoided the issue... but was not a solution.

## Solution


Add this to "~\.gitconfig"

	[http]
	proxy = http://myusername:mypassword@myproxy.domain.com:8080

...and because there is an '@' in myusername, i encoded that as %40

and to find out my proxy... well that was tricky, but same as described in [resolve: mercurial abort: error](../mercurial/proxy_connection_attempt_failure.md)

i.e........

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

So I took one of the proxy addresses from there 


# What if you don't have a password?

Some users use some kind of single-sign on token system where they don't really have a password. That's great and modern... but what do you stick in the config?

In visual studio .com you can create a token, called a private access token -- then use the token here:



	[http]
	proxy = http://anything:PAT@myproxy.domain.com:8080

Where PAT is the private access token, and the proxy is found as described above.

