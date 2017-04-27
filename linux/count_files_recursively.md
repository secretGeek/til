# count all files in a directory, recursively

Count files in current folder not recursive:

    ls -1 | wc -l

Count files only:

    find . -type f | wc -l

Count files and directories:

    find . | wc -l
    
Count directories only:

    find . -type d | wc -l

    
    
Now look at this:

    ~/.nuget$ find . -type f | wc -l
    5259
    ~/.nuget$ find . | wc -l
    10182

The .nuget folder has 5259 files. Even worse... it has almost as many directories as folders!


    
    
## Source

 * [Recursively count all the files in a directory](http://superuser.com/questions/198817/recursively-count-all-the-files-in-a-directory)    