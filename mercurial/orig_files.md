# Got a bunch of .orig files you don't want?

# use powershell to recursively delete all the .orig files created by mercurial after reverting (i.e. abandoning) a change.
dir . *.orig -recurse | % { del $_.FullName }
#i.e. after a hg revert --all
