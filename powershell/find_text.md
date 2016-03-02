# Find text (from powershell)

Use `Select-String` (alias `sls`) and -Pattern (patt)

    sls *.md -patt "hack:"

Need to look recursively, then pipe in the locations from `dir` (`Get-ChildItem`)...

    dir -Path . *.md -Recurse | sls -patt "hack:"

Need to look at multiple file types, use include:

    dir -Path . -Include *.md,*.txt,*.cs,*.cshtml,*.css,*.js -Recurse | sls -patt "hack:"


Some custom formatting out of the output, example

    sls *.md -patt "hack:" | ft -property FileName, Line -autosize | more


If the pattern is not a regex, and just a simple string, use "-SimpleMatch"  (also useful if you want a simple match for some weird text that looks like a malformed regex, as in this example)

    sls *.md -patt "](" -SimpleMatch

