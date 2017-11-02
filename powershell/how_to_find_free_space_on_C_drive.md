# How to find how much free space is left on a drive


In short:

	get-psdrive C

Bit lengthier...

	get-psdrive C | % { "" + $_.Used/1GB + " GB used, " + $_.Free/1GB  + " GB free"}

Or lengthier still:

	get-psdrive C | % { "" + "{0:0.00}" -f ($_.Used/1GB) + " GB used, " + "{0:0.00}" -f ($_.Free/1GB)   + " GB free"}