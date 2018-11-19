# The easy way to serve a markdown file in the browser

    pip install grip
    grip markdown.md


Will serve your file at `localhost:xxx` (some port number)

And if/when you modify the file, the page will automatically refresh!

Wonderful stuff.

This problem comes up a lot for me though:

    LookupError: unknown encoding: cp65001
    Logged from file _internal.py, line 87

And this solution from stackoverflow seems to help:

    set PYTHONIOENCODING=utf-8

Or in powershell-ese...



    $env:PYTHONIOENCODING = "utf-8"



## Source

 * [Python: Emit some Utf-8 string to windows console](http://stackoverflow.com/questions/10321611/python-emit-some-utf-8-string-to-windows-console)