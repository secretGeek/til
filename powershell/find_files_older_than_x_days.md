# Find Files Older than X Days



	Get-ChildItem | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}

Recursive, and short hand...

	dir -rec | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-30)}


To a table with just the attributes I want:


	dir -rec | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} |  format-table -property Length, LastWriteTime, FullName


To a tab separated string (columns are "Size (Bytes)", "Days Old", "Full Name")

	dir -rec | ? {$_.LastWriteTime -lt (Get-Date).AddDays(-30)} | 
		% { "" +$_.Length + "`t" + $(New-TimeSpan -start $_.LastWriteTime -End (Get-Date)).Days + "`t" + $_.FullName } | clipp


Or just find the 10 oldest files 


	dir -rec | sort lastwritetime | select -f 10 

Or find the 10 oldest files and show them in a neat table


	dir -rec | sort lastwritetime | select -f 10 |format-table -property @{Expression={(New-TimeSpan -start $_.LastWriteTime -End (Get-Date)).Days};Label="Days"},Length, FullName