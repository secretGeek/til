# diff of staged files

You've committed locally (i.e. staged some changes) but haven't yet pushed your changes.

You are then dismayed because `git diff` returns NOTHING.

So use:

    git diff --cached
    
To see the changes that are staged.
