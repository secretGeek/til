# sudo

If running as a normal (non-root) user, you will often find that permission is denied. To demand that a command be granted permissions, preface it with sudo.

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


    
    
You can make LibreOffice (for example) work with sudo without requiring a password by adding this line to you sudoers file:

    users ALL=(ALL) NOPASSWD: libreoffice

Altho' 
    
> Allowing sudo to libreoffice for everyone without password is opening a can of worms. Please beware of the consequences, including the possibility to acquiring root permissions on a multi-user platform 

