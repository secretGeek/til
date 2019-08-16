# git stash: very useful

It's nice to have clean commits and branches and so on.

One tool that helps with this is `stash`

If you have some changes you are not ready to commit, you can "stash" them aside, using:

    git stash

Then you can -- for example -- switch to a branch where you want to apply those changes... or do some other more urgent work... 

and when you're in a place where you want those changes back, you can use

    git stash apply

...to bring them back, but leave them in the stash.

If you no longer need them in the stash, use 

    git stash drop


...to clean the stash.


(You could've used `git stash pop` to apply them *and* remove them from the stash. Up to you.)

Use 

    git stash list

To see all your stashes. 

If you stash one thing then another, it forms a stack of stashes. Thus the `pop` naming above.

The topmost item is called "stash@{0}" next is "stash@{1}" etc.

To see the item on top of the stack of stashes, in more detail, use:

    git stash show

To see a specific item in the stack use:

    git stash show -p "stash@{3}"

...where {3} is the item you're looking at.


# Avoiding the "Too many revisions specified" error

Note that with powershell, if you leave out the double-quotes, i.e.

	git stash show -p stash@{0}

...you'll receive the error:

	Too many revisions specified: 'stash@' 'MAA=' 'xml' 'text'
BRIGST-L-96559 master C:\Apps\repo\MonoRepo\QAPortal\Sps.QAPortal.WebUI\Helpers>


# Further reading

 * [git-stash](https://git-scm.com/docs/git-stash/1.5.5)