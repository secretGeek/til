# Merge pull request via command line

If you do not want to use the merge button (or an automatic merge cannot be performed) you can perform a manual merge on the command line.


Step 1: From your project repository, check out a new branch and test the changes.

    git checkout -b doekman-master master
    git pull https://github.com/doekman/console-adventure.git master

Step 2: Merge the changes and update on GitHub.

    git checkout master
    git merge --no-ff doekman-master
    git push origin master