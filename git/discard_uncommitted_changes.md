# Discard uncommitted changes

You just realized the  path you've been going down was not right and you want to:

* Discard uncommitted changes
* Some of which are on tracked files (files previously committed) and
* Some of which may be on new files (files which are not tracked, have never been committed) and

	git stash
	git stash drop

^^ this will stash the changes to tracked files, and then lose them with drop.

	git clean -nd 

^^ This will let you see the untracked files that would be deleted (including directories)

If you're happy to lose the changes it lists then run:

	git clean -fd

^^ This will delete the untracked files