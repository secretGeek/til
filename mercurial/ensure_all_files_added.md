# Ensure all files are added before a commit

In order to ensure all files have been added (or .hgignored) before going ahead with a commit, add the following pre-transaction commit hook to your [mercurial.ini](mercurial_ini.md) file


    [hooks]
    pretxncommit.add_all_files_first_please = hg stat | findstr "? " && EXIT /B 1 || EXIT /B 0

But i've had to disable that because it fails if i have a local commit that added a file, which ["fetch"](current_extensions.md) is merging to an incoming commit that also added files. or something like that.

## See also

 * [The little known beauty of .ensure files](http://www.secretgeek.net/ensure)

