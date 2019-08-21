# Delete old branches


When I merge a pull request back into main, I delete the branch on the server

But that doesn't delete it locally.

I end up with a bunch of local branches that need cleaning.

If I switch to such branches I see a message that "the upstream is gone."

	> git checkout feature/1234-weaponise-space
	Switched to branch 'feature/1234-weaponise-space'
	Your branch is based on 'origin/feature/1234-weaponise-space', but the upstream is gone.
	  (use "git branch --unset-upstream" to fixup)

Yes. The upstream is *gone*. Because when the pull request was completed we chose to delete the branch on the server.

Now it's time to delete the local branch.

## Delete local branch

To delete a local branch.

1. Make sure you want it gone.
2.



> Delete Local Branch
> To delete the local branch use one of the following:
>
>    $ git branch -d branch_name
>    $ git branch -D branch_name
>
> Note: The `-d` option is an alias for `--delete`, which only deletes the branch if it has already been fully merged in its upstream branch. You could also use `-D`, which is an alias for `--delete --force`, which deletes the branch "irrespective of its merged status." [Source: man git-branch]



## Find all 'gone' branches to delete:


	> git branch -vv

Lists all branches and has `: gone]` if their remote component has been removed. e.g.


	> git branch -vv

	FrogTracking								2583eea0 [origin/FrogTracking: behind 49] monkey-magnet fixed attributes on user columns
	Gespacio									e05bafd8 [origin/Gespacio: gone] Added .gitignore file to exclude .hg folder
	bug/5928-cat-chaser-ignores-2-user-columns	2583eea0 [origin/bug/5928-cat-chaser-ignores-2-user-columns: gone] monkey-magnet fixed attributes on user columns
	env-test									73e5707d [origin/env-test] remove merge markers
	feature/5784-moon-tooth						b1ec5764 [origin/feature/5784-moon-tooth: gone] 5784: moon-truth is more testable
	feature/5784-sheep-dip-re-encoder			2b60c485 [origin/feature/5784-sheep-dip-re-encoder: gone] remove commented out code
	feature/5792-cloud-taser-convert			88019a36 [origin/feature/5792-cloud-taser-convert: gone] Merge branch 'FrogTracking' into feature/5792-cloud-taser-convert
	feature/5829-convert-hops-in-shops			3816b859 [origin/feature/5829-convert-hops-in-shops: gone] hops-ify Sync moon-boot-fighter.
	feature/5884-funtegra-import-yard			d55774bc [origin/feature/5884-funtegra-import-yard: gone] funtegra: import users from yard
	feature/5959-oops-counter-Color				a111c73b [origin/feature/5959-oops-counter-Color: gone] Build pipelines: removed file moon-web-build.yml
	feature/5992-monkey-magnet-current-archive	d2f88379 [origin/feature/5992-monkey-magnet-current-archive] Sync monkey-magnet default table renamed
	* master									d16af51f [origin/master] Merge master into this branch
	refactor/cloud-taser-utc-datetime-handling	5da44411 [origin/refactor/cloud-taser-utc-datetime-handling: gone] moon: 5888 cloud-taser Online.

So the real point here is `: gone]` substring referring to the missing origin.


## To delete the origin 

(for example, if you forgot to delete it when merging your pull request)

Delete it on the origin....

	git push --delete origin feature/5992-monkey-magnet-current-archive

Then delete it locally (may need to switch out of it first with `git co master`, for example)

	git branch -d feature/5992-monkey-magnet-current-archive

May need to use `-D` to force the delete if there's some discard-worthy change in there.


