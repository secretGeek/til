# Find Files Older than X Days



	Get-ChildItem | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}

Recursive, and short hand...

	dir -rec | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}


To a table with just the attributes I want:


	dir -rec | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} |  format-table -property Length, LastWriteTime, FullName


To a tab separated string (columns are "Size (Bytes)", "Days Old", "Full Name")

	dir -rec | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | 
		% { "" +$_.Length + "`t" + $(New-TimeSpan -start $_.LastWriteTime -End (Get-Date)).Days + "`t" + $_.FullName } | clipp