# git messes up hg colors? and vice versa?

if you use the "colors" extension in mercurial, you may find that the output of git is all messed up.

i have these two functions: `git_on` and `git_off`.


Run `git_on` when u want `git log` to work, `git_off` when you want `hg colors` to work.


git_on    -- stop git log from being bad, but ruin hg colors

    function git_on {
        $env:TERM="msys" # note that this is bad for hg colors, but good for git log!
    }
    
git_off    -- ruin git log, but stop hg colors from being bad

    function git_off {
        $env:TERM="" # note that this is bad for git log, but good for hg colors!
    }

