# Turn off Bing Search Results from Start Menu in Windows

When you do a search in the start menu in Windows 10, it shows Bing Search results.

I don't want this. I never wanted this. I never will want this.

Disable it with:

	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0


## Source


* [Nick Craver on twitter](https://twitter.com/Nick_Craver/status/1138231377055363074)