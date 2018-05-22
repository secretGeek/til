# Where to find the logs for a site?

If you click on the "Sites" node in IIS manager, you'll see summary info for all sites at once. One column is an ID for each app. Hold onto that ID, e.g. "8"

Then look in the "Logging" module for the site you're interested. You'll see a directory such as "%SystemDrive%\inetpub\logs\LogFiles"

If the ID is "8" that means its logs are in "C:\inetpub\logs\LogFiles\w3svc8"

