# bg,fg: background and foreground!


You're in `nano` and you hit Ctrl-z thinking it will undo what you just did... but no, suddenly you slip through a crack in the matrix and learn all all about "bg,fg: background and foreground" -- multi-tasking in linux.

    Ctrl Z - go to background. 
    
    fg -- go back to nano in foreground

You may be wondering what the heck I am talking about there?

It's multi-tasking!

You can temporarily jump out of `nano`, run a command, see something... and then jump back in.

If, while in the background, you run a new instance of nano (or some other program) and then use `Ctrl Z` to go to the background... how do you jump back to the original nano?

When you exit with `Ctrl Z` you see text like:

    Use "fg" to return to nano.

    [1]+  Stopped                 sudo nano default

That "1" is the job you will jump back to with `fg`


To see all backgrounded jobs, use the `jobs` command, 

For example, here I've got two `nano` instances stopped...


    [1]-  Stopped                 sudo nano default
    [2]+  Stopped                 nano default.backup

To jump to the one I prefer I can use '`fg 1`' or '`fg 2`'

Magical stuff, and easy to remember for some reason. It became natural pretty quick. I guess because I press Ctrl Z so often anyway.

## See also

 * [nano](nano.md)
 
 