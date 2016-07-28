# Bash for Windows User

    clear -- (similar to cls) clears the screen. (not quite, see notes below)
    ls   -- (similar to dir) list contents of current folder
    cd ..   -- moves up as expected
    cat     -- (same as type or get-content) dump contents on a file to screen
    cd [foldername] -- and of course names are CASE-SENSITIVE in linux land.
    mkdir -- (same as md) make directory
    cp -- (same as copy) copy one or more files into the current location
    
for "help" on any command:

    ls --help
    
use up arrow to cycle through previous commands (same as dos)
use Ctrl C (displayed as ^C) to break the current activity.  (same as dos)

    echo hello | xclip -selection c   ...pipe to the clipboard (sort of)ia
    
## Bash extra Notes....

clear -- (same as cls) clears the screen.... well:
-- Note it doesn't really clear the screen as you scroll up and the text is still there.
-- this command however *does* reset the terminal: printf "\033c"

(when I get profiles working i'll define an alias for cls, like this: alias cls='printf "\033c"')
    
Clipboard -- the short answer is "gfys"
    
    alias clipo="xclip -selection c" 
    alias pasto="xclip -selection clipboard -o"

Files in linux are case senstive, furthermore, they generally don't have file extensions (.txt etc). so ~/etc/profile is a file not a folder.

Dot files (files beginning with a "." are hidden.)

to go to your home folder, use:

    cd $home

(That and `ls` are the only two things I remember from using Unix at university. Oh and pine.)

## keyboard shortcuts

 * `ctrl-tab`  -- switch tab/document within an application
 * `alt-tab` -- switch applications
 * `ctrl-W` -- close document
 * `ctrl-Q` -- quit application

   

