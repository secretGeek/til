# How to rename photos, using EXIF data (with powershell)

You can inspect the EXIF data of a photo by uploading it to here: <http://exif.regex.info/exif.cgi>

You can rename a photo, such that its name is based on the *second* at which it was taken, in a **sortable** manner, with this snippet:

	$null = [reflection.assembly]::LoadWithPartialName("System.Drawing")
	$pic = New-Object System.Drawing.Bitmap($fileName)

	# via http://stackoverflow.com/questions/6834259/how-can-i-get-programmatic-access-to-the-date-taken-field-of-an-image-or-video
	$bytearr = $pic.GetPropertyItem(36867).Value # Date Taken
	$pic.Dispose() # note... must dispose of the pic, if you wish to be able to rename the file! Otherwise get a fil in use error.
	
	$string = [System.Text.Encoding]::ASCII.GetString($bytearr) 
	$exactDate = [datetime]::ParseExact($string,"yyyy:MM:dd HH:mm:ss`0",$Null)
    $length = (dir $fileName | % length )
	$extensionWithDot = [io.path]::GetExtension($FileName)
	$newName = ("{0:yyyy-MM-dd-HH-mm-ss}_{1}_{2}_{3}{4}" -f $exactDate, $device, $location, $length, $extensionWithDot)
	
	write-host "Creating: $newName"
	rename-item $fileName $newName

...all of which is wrapped up in function called 'RenamePhoto' which is dotted by my `$profile`

Note that you can still have problems caused by timezones!	




## Source

 * <http://exif.regex.info/exif.cgi>
 * [StackOverflow: How can I get programmatic access to the “Date taken” field of an image or video using powershell?](http://stackoverflow.com/questions/6834259/how-can-i-get-programmatic-access-to-the-date-taken-field-of-an-image-or-video)

