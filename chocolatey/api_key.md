# How to generate, find and use a chocolatey API Key

(Useful if you are publishing a package)

(This is a made up APIkey for example purposes... if it happens to be yours I am sorry, and quite surprised) -- fddb4ab2-3149-3620-c89d-18aca1c87a55

To generate or find your chocolatey api key, go to: https://chocolatey.org/account

There you will see a message like this:

	choco apikey --key fddb4ab2-3149-3620-c89d-18aca1c87a55 --source https://push.chocolatey.org/

The first command sets the apikey you are using for a given source. It is encrypted, encoded and stored in your chocolatey config file, here:

	C:\ProgramData\chocolatey\config\chocolatey.config

Which will say something like...

	<chocolatey>
	<apiKeys>
		<apiKeys source="https://push.chocolatey.org/" key="Huge nasty base64 encoded encrypted apikey"
		/>
	  </apiKeys>
	</chocolatey>

Earlier I was getting this error message:

	ACTION: Please update your apikey to use
	  'https://push.chocolatey.org/'
	 instead of
	  'https://chocolatey.org/'.
	 The latter source url is now considered deprecated and will not be
	 checked as the default source in Chocolatey v1.0. For details, run
	 `choco apikey -?`

I read the help at `choco apikey -?` and read everything online... it was only when I went to `https://chocolatey.org/account` and found that command above, including my apikey, and ran it... that the problem was resolved.


