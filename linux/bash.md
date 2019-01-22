# Bash for Windows User

|Command|Similar to|Notes|
|-------|----------|-----|
|`clear` |`cls`| clears the screen. (not quite, see notes below)|
|`ls`    |`dir`| list contents of current folder. `ls -a` to see `all` (includes hidden)|
|`cd ..` |`cd..`|moves up as expected|
|`cat`   |`type` or `get-content`| dump contents of a file to screen|
|`cd [foldername]`|`cd [foldername]`| be aware that names are CASE-SENSITIVE in linux land.|
|`mkdir` |`md`| make directory|
|`cp` |`copy`| copy one or more files into the current location|
|`rm` |`del`| remove one or more files (or directories, using -d or -r)|
|`rmdir` |`rd`|remove directory|
|`more` |`more`|show results one page at a time|


for "help" on any command:

    ls --help

Or, to review the manual...

    man ls

use up arrow to cycle through previous commands (same as dos)

use Ctrl C (displayed as ^C) to break the current activity.  (same as dos)

    echo hello | xclip -selection c   ...pipe to the clipboard (sort of)


## Bash extra Notes....

clear: (same as cls) clears the screen, well....

Note it doesn't really clear the screen as you scroll up and the text is still there.
this command however *does* reset the terminal: printf "\033c"

(when I get profiles working i'll define an alias for `cls`, like this: `alias cls='printf "\033c"'`)

Clipboard -- the short answer is "gfys"

    alias clipo="xclip -selection c"
    alias pasto="xclip -selection clipboard -o"


Files in linux are case senstive, furthermore, they generally don't have file extensions (.txt, .pdf etc). so ~/etc/profile is a file not a folder.

Dot files (files beginning with a ".") are "hidden". (Hidden is not so much a security concept as a convenience feature... they're just tucked away) To view **a**ll files (including hidden) use `ls -a`

To go to your home folder, use simply:

    cd

(That and `ls` are the only two things I remember from using Unix at university. Oh and pine.)

## keyboard shortcuts

 * `ctrl-tab`  -- switch tab/document within an application
 * `alt-tab` -- switch applications
 * `ctrl-W` -- close document
 * `ctrl-Q` -- quit application
 * `shift-ctrl-C` -- copy to clipboard
 * `shift-ctrl-V` -- paste from clipboard

 
## Cheat sheet

* <https://devhints.io/bash> -- really nice cheat sheet

## Source

 * <https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-on-ubuntu-and-centos>
 * <http://www.tldp.org/LDP/abs/html/io-redirection.html>
 