# Change google chrome on startup page, despite being "enforced by administrator"

On a corporate machine, the google chrome homepage was set to an intranet page that did not load correctly due to authentication problems. I couldn't change it because:

> This setting is enforced by your administrator.

I found I needed to edit the settings under:

	HKEY_CURRENT_USER\SOFTWARE\Policies\Google\Chrome\

Specifically under:

	HKEY_CURRENT_USER\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs

I saved the relevant snippet to a `.reg` file, adjacent to my [powershell profile](../powershell/create_profile.md), so I can re-apply it later if needed.

Its content is somewhat like this:

	Windows Registry Editor Version 5.00

	[HKEY_CURRENT_USER\SOFTWARE\Policies\Google\Chrome\RestoreOnStartupURLs]
	"1"="http://{the url i wanted}"

## Source

* [Startup Settings In Chrome Disabled](https://stackoverflow.com/questions/20424125/startup-settings-in-chrome-disabled)