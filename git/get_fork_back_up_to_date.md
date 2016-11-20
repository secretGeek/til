# How to get a fork back up to date with the original repo it is forked from


1.  From the local project directory:
    
    git remote add upstream <url-of-original-repository>

e.g. 

    git remote add upstream git://github.com/aspnet/Docs.git

2.	`git branch` (to verify you are on master branch)

3.	`git pull --rebase upstream master`


Only need to do step 1 the first time. (It is how you add a named remote location called 'upstream')

So `upstream` is not a keyword or a reserved word: it is just a convention. It's the usual name to give the remote from which the repo was forked.

You can view your `remotes` (in detail) by using:

    git remote -v

    origin      https://github.com/secretGeek/Docs.git (fetch)
    origin      https://github.com/secretGeek/Docs.git (push)
    upstream    git://github.com/aspnet/Docs.git (fetch)
    upstream    git://github.com/aspnet/Docs.git (push)
    
    
## Source

 * [Stackoverflow: Updating forked GitHub repo to match original's latest code and commits](http://stackoverflow.com/questions/18824956/updating-forked-github-repo-to-match-originals-latest-code-and-commits)