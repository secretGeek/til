# Installing bash on windows.

You need to have (at least) Windows 10 anniversary edition:

Check with `[Environment]::OSVersion.Version` (see [How can I tell which version of Windows is currently running?](which_version.md)), you want at least "10.0.14393.0"

> Once you're sure you're using the correct version, open the Settings app and head to Update & Security -> For Developers. Activate the "Developer Mode" switch here to enable Developer Mode.

You get a super scary warning (because you'll be allowing "apps" to be sideloaded)

Then a message... "installing developer mode package..."

The excitement is building...

I didn't get past that message until I'd cleared a bunch of space on my machine and restarted... it seems to have worked... Next step...

> Control Panel -> Programs -> Turn Windows Features On or Off under Programs and Features.

Enable the "Windows Subsystem for Linux (Beta)" option in the list here and click OK.

restart.

run bash.

You have to confirm some scary shit.

The first time it's run it downloads some stuff. Message:

    -- Beta feature --
    This will install Ubuntu on Windows, distributed by Canonical
    and licensed under its terms available here:
    https://aka.ms/uowterms

    Type "y" to continue
    Downloading from the Windows Store... 8%

It asks you to enter a username and create a password.

Then you're in.

Documentation link: <http://aka.ms/wsldocs>

All the normal [getting started on bash](../linux/bash.md) stuff applies. (See also: [A Quick Intro to Linux Command Line for Windows Users](http://blog.robertelder.org/intro-to-linux-command-line-for-windows-users/) and [A Quick Intro to Linux Shell Scripting for Windows Developers](http://blog.robertelder.org/intro-to-linux-shell-scripting-for-windows-developers/) )

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

And guidance from windows is very clear: DO NOT EDIT any files in this \lxss\ folder using Windows applications.

 * [Do not change Linux files using Windows apps and tools](https://blogs.msdn.microsoft.com/commandline/2016/11/17/do-not-change-linux-files-using-windows-apps-and-tools/)

This is a pretty fundamental issue... I was bitten by this almost immediately... i edited my profile using Notepad++ -- and linux promptly discarded and recreated the file. I was confused until I read the above article (weeks later!)

>If WSL can't find Linux file metadata for a given file, it assumes the file is corrupted/damaged, and will likely fail to open/read the file correctly, causing apps, tools, etc. to fail and in some cases, delete files seen as "corrupt"!
>
>File metadata (e.g. permissions, ownership, timestamps, etc.) is represented differently in Linux than in Windows. Because stores your Linux files in an NTFS folder, WSL calculates and persists each Linux file's metadata in its NTFS extended attributes.
>
>However, Windows apps do not know how to (nor that they should) re-calculate & persist this Linux metadata each time they create/modify a file stored under your distro's root (%localappdata\lxss\).
>
>Therefore, if you use a Windows app/tool/console to create and/or modify a file under your distro root, it won't have any Linux file metadata (e.g. permissions, owner, timestamps, etc.) stored in its extended attributes.


Next things to do...

    sudo apt-get install xclip
    sudo apt-get install zsh
    sudo apt-get install tree


Apparently:

> bash.exe -c "/usr/zsh" will launch zsh directly

from <https://twitter.com/hmemcpy/status/786936955292483584>


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


## Another error...

If you see this...


	Windows Subsystem for Linux has no installed distributions.
	Distributions can be installed by visiting the Microsoft Store:
	https://aka.ms/wslstore

You go there and it takes to the windows store (on your machine) where you get a choice of Linux distros. Wow.

I picked ubuntu. It's about 200 MB.

When it was "ready" I launched it. THis opened a console, and the console said:

    Installing, this may take a few minutes...

The home folder is now stored at:

    C:\Users\leonb\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\leon

...which is an ad for using markjump.

Note you can install all the different distributions side by side. 

* Ubuntu
* openSUSE Leap 42
* SUSE Linux Enterprise Server 12
* Debian 
* Kali Linux 

And they have star ratings in the windows store. Ubuntu and Kali are popular. Others not so much.


## Source

 * [How to Install and Use the Linux Bash Shell on Windows 10](http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/)
 * [Warning! Do not change Linux files using Windows apps and tools](https://blogs.msdn.microsoft.com/commandline/2016/11/17/do-not-change-linux-files-using-windows-apps-and-tools/)
 * [A Quick Intro to Linux Command Line for Windows Users](http://blog.robertelder.org/intro-to-linux-command-line-for-windows-users/)
 * [A Quick Intro to Linux Shell Scripting for Windows Developers](http://blog.robertelder.org/intro-to-linux-shell-scripting-for-windows-developers/)


## See also

 * [How can I tell which version of Windows is currently running?](which_version.md)
 * [getting started on bash](../linux/bash.md)
