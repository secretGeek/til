# Merging failed... and was subseqeuntly fixed!

    merging with 180:84824a35b0d3
    merging somefile.config
     output file somefile.config appears unchanged
    was merge successful (yn)? n
    merging somefile.config failed!
    merging otherfile.config
    merging thirdfile.config
     output file thirdfile.config appears unchanged
    was merge successful (yn)? n
    merging thirdfile.config failed!
    1 files updated, 1 files merged, 28 files removed, 2 files unresolved
    use 'hg resolve' to retry unresolved file merges or 'hg update -C .' to abandon


How did this fail? Because diffmerge (sgdm) complained that invalid arguments were passed to it. So I went to `$env:userprofile\mercurial.ini` to hunt down the way diffmerge was configured.

it said:

    diffmerge.args = -merge -result= -t1="Local Version" -t2= -t3="Other Version" -caption=

but my notes suggested it should be:

    diffmerge.args = -merge -result=$output -t1="Local Version" -t2=$output -t3="Other Version" -caption=$output $local $base $other

So I updated it accordingly

Now I'm going to "retry unresolved files merges" as in the error message I received originally...

I tried:

    hg resolve
    abort: no files or directories specified; use --all to remerge all files

So I try with the good old....

    hg resolve --all

That seems to have worked... I now have a three way merge window... and i can proceed just fine.

Left behind are some .orig files, which I delete with the good old:

    dir . *.orig -recurse | del


## See also

 * [Got a bunch of .orig files you don't want?](orig_files.md)
 * [Configure mercurial to use sourcegear diffmerge for merging](diffmerge_merge.md)
 * [mercurial.ini](mercurial_ini.md)