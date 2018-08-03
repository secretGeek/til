# Download a webpage to a file, from Powershell

Really easy....

	(Invoke-WebRequest -URI "http://example.com/index.html").content | out-file "index.html"