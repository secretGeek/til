# date format in powershell

Simple!

    get-date -f "yyyy-MM-dd HH:mm:ss"

or...

    (get-date).ToString("yyyy-MM-dd")

or better (worse) yet

	[system.string]::format("{0:yyyy-mm-dd}", (get-date))


Formatting a list of dates...

	dir *.txt | % { $_.LastWriteTime.ToString("yyyy-MM-dd") }	
