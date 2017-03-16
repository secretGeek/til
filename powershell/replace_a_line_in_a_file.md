# Replace a line in a file

This is a common admin task. You might need to replace the publishing date, or the copyright year, or the author's name or some other piece of information. How to replace it... Like so:


    $targetFile = 'FileName.ps1'
    $regex = '^This is the old line$"' 
    $with = "This is the new line"
    (Get-Content $targetFile) -replace $regex, $hashyLine | Set-Content $targetFile

Unexplored edge cases... what happens to the encoding? What if you want to replace one thing many times on a single line? What if it's not the whole line, etc. What if you only want to do the replace on the first match, or on the last match?

## See also

 * [Giving Chocolatey a Checksum when creating a package](../chocolatey/specify_checksum_for_chocolatey.md)