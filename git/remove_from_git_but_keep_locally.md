# Remove a file from git but keep the local file

First: to make sure you don't add it, commit it or push it in future -- **add it to your .gitignore file**.

if you haven't added it, committed it or pushed it... do nothing (you added it to .gitignore above right?)

if you've added it, but haven't committed it or pushed it... (you've since added it to .gitignore above right?)

    git reset {someFile}


if you added it, committed it, maybe even pushed it... (you've since added it to .gitignore above right?)
    
 * for a file:

    git rm --cached {someFile}

 * for a directory 

    git rm --cached -r {someDir}


This assumes the file doesn't contain sensitive stuff.

If it contains sensitive stuff, and you've already committed it, then research the right approach, polish your resume etc. 


## Source

 * http://stackoverflow.com/questions/3469741/remove-file-from-the-repository-but-keep-it-locally
 * http://stackoverflow.com/questions/1143796/remove-a-file-from-a-git-repository-without-deleting-it-from-the-local-filesyste
 