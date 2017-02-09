# Configure mercurial to use sourcegear diffmerge for merging

In your [mercurial.ini file](./mercurial_ini.md)(i.e. $env:userprofile\mercurial.ini) specify...

    [ui]
    merge = vdiff

    [extensions]
    hgext.extdiff =

    [extdiff]
    cmd.vdiff = C:\Program Files\SourceGear\Common\DiffMerge\sgdm.exe

    [merge-tools]
    vdiff.executable = C:\Program Files\SourceGear\Common\DiffMerge\sgdm.exe
    # vdiff.args = -merge -result=$output  $local $base $other
    vdiff.args = -merge -result=$output -t1="Local Version" -t2=$output -t3="Other Version" -caption=$output $local $base $other
    vdiff.binary = False
    vdiff.symlinks = False
    vdiff.gui = True
    vdiff.premerge = True


    
If you first want to verify that path... 

    test-path "C:\Program Files\SourceGear\Common\DiffMerge\sgdm.exe"    
    
## Source

  * <https://sourcegear.com/diffmerge/webhelp/sec__mercurial__windows__native.html>