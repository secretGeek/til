# Convert a mercurial repo to git

The following is based on the technique from here: <https://stackoverflow.com/a/39906349> and it is relevant because it retains more than 1 branch.

The process (for us) is:

## pre-requisites 

1. [ ] Make sure you have git installed.  <https://git-scm.com/downloads> - click on windows
	
	Use the default options. But you may want a different editor for commit message than vim. 

## Steps

In the repo you wish to migrate:

  1. [ ] Add these to your `mercurial.ini`:

		 [git]  
		 branch_bookmark_suffix=_bookmark
		
		 [extensions]
		 hggit = 
		
  2. [ ] check that `hggit` is recognised by running `hg help`; expect to see this under "enabled extensions":

		> hggit         push and pull from a Git server
		
 3. [ ]  create a bookmark called "master" to represent the "default" branch

		hg bookmarks -r default master

     ...we do that because 

	> hg-git does not convert between Mercurial named branches and git branches as the two are conceptually different; instead, it uses Mercurial bookmarks to represent the concept of a git branch<br />
	> &mdash;[Hg-Git Mercurial Plugin readme](https://github.com/schacon/hg-git#gitbranch_bookmark_suffix)
		
		
 4. [ ] for each branch (found via `hg branches`) run this command:

		hg bookmarks -r my_branch my_branch_bookmark  

	(... but replacing `my_branch` with the name of **your** branch.)

Those mercurial bookmarks will be turned into branches in git.

You're now ready to create the git repo. 😄
	
 5. [ ] Create it like so:

	    hg gexport

There will now be a folder called `git` under the `.hg` folder.

This is a "bare" repo.

You can `clone` it in git, or can follow a few steps to turn it into a "non-bare" repo.

## To convert a `--bare` repository to a non-bare:

Make a `.git` folder in the top-level of your intended new repository location.

Copy the contents of the `git` bare repository into the `.git` folder you just created. i.e. copy the repository management things (HEAD branches config description hooks info objects refs etc.) into your new folder.

Run:

    git config --local --bool core.bare false 

...to convert the local git-repository to non-bare.

Stare and compare that the new git repo matches the old hg repo, until you are completely satisfied.

## Sources

* [Matthias's Answer to "Convert Mercurial project to Git"](https://stackoverflow.com/a/39906349)
* [Stackoverflow: How do I convert a bare git repository into a normal one (in-place)?](https://stackoverflow.com/a/10637882)
