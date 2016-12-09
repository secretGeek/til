# Remove trailing whitespace

This is the biggie.

Any text editor can run custom tasks and do powerful things with regular expressions or have a rich plugin ecosystem and beautiful themes and integrated debugging experience....

But does it trim trailing whitespace!? By default!?

From [SO: Remove trailing spaces automatically or with a shortcut](http://stackoverflow.com/questions/30884131/remove-trailing-spaces-automatically-or-with-a-shortcut)

1. Open VS User Settings (`File > Preferences > User Settings`).
This will open two side-by-side documents.

2. Add a new setting:

`"files.trimTrailingWhitespace": true`

...to the User Settings document **on the right**: `settings.json`. (This is so you aren't editing the Default Setting directly, but instead adding to it and thus over-riding it.)

3. Save the User Settings file.

Note the user settings files is stored here:

    $env:APPDATA\Code\User\settings.json

aka

    %APPDATA%\Code\User\settings.json

## Source

 * <http://stackoverflow.com/questions/30884131/remove-trailing-spaces-automatically-or-with-a-shortcut>