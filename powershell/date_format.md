# date format in powershell

Simple!

    get-date -f "yyyy-MM-dd HH:mm:ss"

or...

    (get-date).ToString("yyyy-MM-dd")

or better (worse) yet

	[system.string]::format("{0:yyyy-mm-dd}", (get-date))