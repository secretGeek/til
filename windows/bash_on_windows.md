# installing bash on windows.

1. Do have at least Windows 10 anniversary edition/

Check with `[Environment]::OSVersion.Version`, you want at least "10.0.14393.0"

> Once you're sure you're using the correct version, open the Settings app and head to Update & Security > For Developers. Activate the "Developer Mode" switch here to enable Developer Mode.

You get a super scary warning!!

Then... installing developer mode package...

The excitement is building...

After a restart and deleting a bunch of crap off my machine... it seems to have worked... Next step...

> Control Panel -> Programs -> Turn Windows Features On or Off under Programs and Features. 

Enable the "Windows Subsystem for Linux (Beta)" option in the list here and click OK.

restart.

run bash.

you have to confirm some scary shit.

it asks you to enter a username and password.

then you're in.

Documentation link: <http://aka.ms/wsldocs>

Ok -- you're C drive is mounted at:  /mnt/c

You're .profile (in home folder) says:


# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

    # if running bash
    if [ -n "$BASH_VERSION" ]; then
        # include .bashrc if it exists
        if [ -f "$HOME/.bashrc" ]; then
            . "$HOME/.bashrc"
        fi
    fi

    # set PATH so it includes user's private bin if it exists
    if [ -d "$HOME/bin" ] ; then
        PATH="$HOME/bin:$PATH"
    fi


When you run `bash` you are running `C:\Windows\System32\bash.exe`. 

Bash's files/data are stored in this location in windows:

    
    $env:LOCALAPPDATA\lxss

i.e.

    %LOCALAPPDATA%\lxss
    

When you edit your profile in bash, you are editing this file (assuming your linux user name is "LINUSER")

    $env:LOCALAPPDATA\lxss\home\LINUSER\.profile

or

    %LOCALAPPDATA%\lxss\home\LINUSER\.profile
    
    
## Source

 * <http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/>