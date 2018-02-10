## Branching with Mercurial

I've got a [detailed tutorial on branching with mercurial](http://www.secretgeek.net/branching) but here's just the cheatsheet for branching with mercurial:

|Command|Comment|
|-------|-------|
|hg branch | Check which branch you're working on|
|hg branch WEAPONISE_SPACE | Create a branch|
|hg push -b . --new-branch | Push only the current branch (which happens to be new|
|hg push -b . | Push only the current branch|
|hg heads | See if there are any open "heads" (e.g. open branches)|
|hg pull -b . --rebase | Pull just the current branch|
|hg pull -b WEAPONISE_SPACE --rebase | Pull only the contents of a named branch (and merge any local commits you've already made)|
|hg up WEAPONISE_SPACE | Switch to a named branch. So this will update the current working folder to contain the work from the named branch.|
|hg commit -Am "committing here!" | Commit to the current branch, while addremoving files|
|hg commit -m 'Finished Weaponising Space!' --close-branch | Close the current branch (good hygiene)|
|hg up default | Update so that the current branch is now the default branch|
|hg merge WEAPONISE_SPACE | Merge a named branch into the current branch|

## Source

* [Mercurial Workflow with Branching](http://www.secretgeek.net/branching)

