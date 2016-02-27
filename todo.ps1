#dir . *.md -recurse | % { $file = $_.Name; get-content $_.FullName | select-string -pattern "//TODO:" | % { $file.substring(0,20) + ":" + $_.ToString().replace("//TODO:","").trim() }} |  ft -autosize | more

Get-ChildItem -Path . -Include *.md -Recurse | Select-String -Pattern "//TODO:" | ft -property FileName, Line -autosize | more