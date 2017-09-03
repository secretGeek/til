# Find all fonts on your machine

	[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
	(New-Object System.Drawing.Text.InstalledFontCollection).Families

Or -- visit this URL:

	http://pomax.nihongoresources.com/downloads/fonttest/

Which detects all fonts on your computer using a neat trick.

