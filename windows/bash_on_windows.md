# Installing bash on windows.

You need to at least Windows 10 anniversary edition:

Check with `[Environment]::OSVersion.Version` (see [How can I tell which version of Windows is currently running?](which_version.md)), you want at least "10.0.14393.0"

> Once you're sure you're using the correct version, open the Settings app and head to Update & Security > For Developers. Activate the "Developer Mode" switch here to enable Developer Mode.

You get a super scary warning (because you'll be allowing apps to be sideloaded)

Then a message... "installing developer mode package..."

The excitement is building...

I didn't get past that message until i'd cleared a bunch of space on my machine and restarted... it seems to have worked... Next step...

> Control Panel -> Programs -> Turn Windows Features On or Off under Programs and Features. 

Enable the "Windows Subsystem for Linux (Beta)" option in the list here and click OK.

restart.

run bash.

you have to confirm some scary shit.

the first time it's run it downloads some stuff. Message:

    -- Beta feature --
    This will install Ubuntu on Windows, distributed by Canonical
    and licensed under its terms available here:
    https://aka.ms/uowterms
    
    Type "y" to continue
    Downloading from the Windows Store... 8%

It asks you to enter a username and create a password.

then you're in.

Documentation link: <http://aka.ms/wsldocs>

All the normal [getting started on bash](../linux/bash.md) stuff applies.

Your traditional windows C drive is mounted at:  /mnt/c

Your .profile (in home folder) says:

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
    

Next things to do...

    sudo apt-get install xclip
    sudo apt-get install zsh    

    
Apparently:

> bash.exe -c "/usr/zsh" will launch zsh directly    
    
 * [Fun with the Windows Subsystem for Linux, Pete Brown](https://blogs.windows.com/buildingapps/2016/07/22/fun-with-the-windows-subsystem-for-linux/#DYZBzMFA6jH3q4qd.97)
 * [Five fun things you can do with the Windows 10 Bash](https://4sysops.com/archives/five-fun-things-you-can-do-with-the-windows-10-bash/)   

Important thing to do.... keep your packages up to date.

I saw a window spontaneously pop open on Wednesday 13th October 2016, AptPackageIndexUpdate -- 

(see this issue: <https://github.com/Microsoft/BashOnWindows/issues/841>)

Turns out that's ok and perfectly acceptable, for now.



When you restart bash on windows, you might see a message like:

    18 packages can be updated.
    11 updates are security updates.

In which case, don't forget to:

    sudo apt-get update

I found that doing that, then exiting bash and coming back in... I now had:

    26 packages can be updated.
    12 updates are security updates.

So... I ran "sudo apt-get update" again....

And this time when I exited and came back there were no more messages about packages to be updated.

    
Also I found that whenever i used `sudo` I would get a messge:

        unable to resolve host LEONCOMPUTER

Turns out I had to edit `/etc/hosts` (i.e. `sudo nano /etc/hosts`) to tell it that this is the local machine name.

previously it had

    127.0.0.1 localhost

    # The following lines are desirable for IPv6 capable hosts
    ::1 ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ff02::3 ip6-allhosts

I had to add this line:

    127.0.0.1 LEONCOMPUTER

after this line:

    127.0.0.1 localhost
    
        
## Source

 * <http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/>