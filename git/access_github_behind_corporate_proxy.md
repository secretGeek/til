# How to access github behind a corporate proxy

If you receive an error when attempting to use `git://` github addresses behind your corporate proxy, try adding these to config:


	git config --global url.https://github.com/.insteadof git://github.com/

and

	git config --global http.https://github.com.proxy http://yourproxy:8080

(but you will need to know the name/port of your proxy)

Those settings adds this to ~/.gitconfig

	[url "https://github.com/"]
		insteadof = git://github.com/
	[http "https://github.com"]
		proxy = http://yourproxy:8080