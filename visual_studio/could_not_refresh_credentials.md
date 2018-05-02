# vs2017: How to Fix, Refresh credenitals produces 'Unknown error'



Long story short: if logging into Visual Studio 2017 produces this error:
 
	---------------------------
	Microsoft Visual Studio
	---------------------------
	We could not refresh the credentials for the account  
	unknown_error: Unknown error
	---------------------------


You may need to:

1.	Close down VS2017
2.	Go to "C:\Users\{username}\AppData\Local\.IdentityService"
3.	Rename "IdentityServiceAdalCache.cache" as shown below. (for example just add an underscore to it)
4.	Restart VS2017 and log in. 


Problem was exacerbated by having two different accounts attached to the same work email address. One is a 'work' account and one is a 'personal' account. Only the personal account has a password. I thought the problem was with those accounts. But no, all i needed to do was google the final error message and see what SO said.


Via this source: 

* <https://stackoverflow.com/questions/45276188/visual-studio-2017-how-to-fix-error-we-could-not-refresh-the-credentials-for>

