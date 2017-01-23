# nano 

Common shortcut keys which are worth committing to finger memory are:

    Ctrl O - Write Out.
    Ctrl X - Exit

But here's the one I want to remember...

    Ctrl Z - go to background. 
    
For more on that, see [bg,fg: background and foreground](bg_fg_background_and_foreground.md)
    fg -- go back to nano in foreground

You may be wondering what the heck I am talking about there?

It's multi-tasking!

You can jump out of `nano`, run a command, see something... and then jump back in.

If, while in the background, you run a new instance of nano, and then use `Ctrl Z` to go to the background... how do you jump back to the original nano?

When you exit with `Ctrl Z` you see text like:

    Use "fg" to return to nano.

    [1]+  Stopped                 sudo nano default

That "1" is the job you will jump back to with `fg`


To see all backgrounded jobs, use the `jobs` command, 

For example, here I've got two `nano` instances stopped...


    [1]-  Stopped                 sudo nano default
    [2]+  Stopped                 nano default.backup

To jump to the one I prefer I can use '`fg 1`' or '`fg 2`'

    Ctrl K -- delete current line

## See also

 * [bg,fg: background and foreground](bg_fg_background_and_foreground.md)    