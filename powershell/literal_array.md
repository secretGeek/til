# How to create a literal array in powershell

This works....

	$MyArray = @(
		"Item0";
		"Item1";
		"Item2";
	)

Hell, even this works:

	$MyArray = "Item0", "Item1", "Item2";

Both have same type:

	> $MyArray.GetType()
	IsPublic IsSerial Name                                     BaseType
	-------- -------- ----                                     --------
	True     True     Object[]                                 System.Array
	

And both contain strings...

	> $MyArray | % { $_.GetType() }

	IsPublic IsSerial Name                                     BaseType
	-------- -------- ----                                     --------
	True     True     String                                   System.Object
	True     True     String                                   System.Object
	True     True     String                                   System.Object
	
So I think the second one is simpler. Go with that.