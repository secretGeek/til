# Bash for Windows User

    clear -- (similar to cls) clears the screen. (not quite, see notes below)
    ls   -- (similar to dir) list contents of current folder
    cd ..   -- moves up as expected
    cat     -- (same as type or get-content) dump contents on a file to screen
    cd [foldername] -- and of course names are CASE-SENSITIVE in linux land.
    mkdir -- (same as md) make directory
    cp -- (same as copy) copy one or more files into the current location
    rm -- (same as del) remove one or more files (but not folders)
    rmdir -- remove directory
    
for "help" on any command:

    ls --help

Or, to review the manual...

    man ls
    
use up arrow to cycle through previous commands (same as dos)

use Ctrl C (displayed as ^C) to break the current activity.  (same as dos)

    echo hello | xclip -selection c   ...pipe to the clipboard (sort of)
    
    
## Bash extra Notes....

clear -- (same as cls) clears the screen, well....

Note it doesn't really clear the screen as you scroll up and the text is still there.
this command however *does* reset the terminal: printf "\033c"

(when I get profiles working i'll define an alias for `cls`, like this: `alias cls='printf "\033c"'`)
    
Clipboard -- the short answer is "gfys"
    
    alias clipo="xclip -selection c" 
    alias pasto="xclip -selection clipboard -o"

    
Files in linux are case senstive, furthermore, they generally don't have file extensions (.txt etc). so ~/etc/profile is a file not a folder.

Dot files (files beginning with a ".") are hidden. To view **a**ll files (including hidden) use `ls -a`

To go to your home folder, use simply:

    cd 

(That and `ls` are the only two things I remember from using Unix at university. Oh and pine.)



## Sudo

if running as a normal (non-root) user, you will often find that permission is denied. To demand that a command be granted permissions, preface it with sudo.

e.g.

    apt-get update    
    W: chmod 0700 of directory /var/lib/apt/lists/partial failed - SetupAPTPartialDirectory (1: Operation not permitted)
    E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
    E: Unable to lock directory /var/lib/apt/lists/
    W: Problem unlinking the file /var/cache/apt/pkgcache.bin - RemoveCaches (13: Permission denied)
    W: Problem unlinking the file /var/cache/apt/srcpkgcache.bin - RemoveCaches (13: Permission denied)
    E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)
    E: Unable to lock the administration directory (/var/lib/dpkg/), are you root?

    sudo apt-get update
    [sudo] password for jenny:

You enter your password...

Doing this requires sudo privileges. Add a user to the sudo group with:

    gpasswd -a jenny sudo

    
## keyboard shortcuts

 * `ctrl-tab`  -- switch tab/document within an application
 * `alt-tab` -- switch applications
 * `ctrl-W` -- close document
 * `ctrl-Q` -- quit application
 * `shift-ctrl-C` -- copy to clipboard
 * `shift-ctrl-V` -- paste from clipboard
   

## Source

 * <https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-on-ubuntu-and-centos>