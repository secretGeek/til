# Alternating row background colors inside groups in SSRS


Click on Report Properties, Code tab...

Custom code:

	Private bOddRow As Boolean
	'*************************************************************************
	' -- Display green-bar type color banding in detail rows
	' -- Call from BackGroundColor property of all detail row textboxes
	' -- Set Toggle True for first item, False for others.
	'*************************************************************************
	Function AlternateColor(ByVal OddColor As String, _
			 ByVal EvenColor As String, ByVal Toggle As Boolean) As String
		If Toggle Then bOddRow = Not bOddRow
		If bOddRow Then
			Return OddColor
		Else
			Return EvenColor
		End If
	End Function


First cell in the row, give it this for background color expression:

	=Code.AlternateColor("Silver","LightGrey", True)
	
Every other cell in the row:

	=Code.AlternateColor("Silver","LightGrey", False)