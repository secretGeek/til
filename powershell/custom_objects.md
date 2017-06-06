# Create custom objects.

Say you have two variables, `$name` and `$count` -- and you want to create a custom object that contains just those two properies....

	$myObject = New-Object psobject -property  @{name = $name; count = $count}
	
Or say you are in a pipeline, within which `$name` and `$count` become available... you want to pipe out a custom object with those two properties...


	| % {
	   $name = $_.FullPath
	   $count = $_.Length 
	   # ^^ just for example
	   
	   New-Object psobject -property  @{name = $name; count = $count}
	   
	   # ^^ Return our custom object... for the next actor in the pipeline to deal with...
	  
	} | ConvertTo-CSV  -NoTypeInformation | out-file "Name_And_Count.csv"  