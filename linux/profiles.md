## Profiles


    cd /etc
    
    cat profile
    cat bash.bashrc
    
    cd $home
    cat .bashrc
    cat .bash_profile
    
> When you login (type username and password) via console, either sitting at the machine, or remotely via ssh: `.bash_profile` is executed to configure your shell before the initial command prompt.
> But, if you've already logged into your machine and open a new terminal window (xterm) inside Gnome or KDE, then `.bashrc` is executed before the window command prompt. `.bashrc` is also run when you start a new bash instance by typing `/bin/bash` in a terminal.    
> <br/>&mdash;<http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html>


And a good tip...

> Most of the time you don't want to maintain two separate config files for login and non-login shells - when you set a PATH, you want it to apply to both. You can fix this by sourcing `.bashrc` from your `.bash_profile` file, then putting PATH and common settings in `.bashrc`.

> To do this, add the following lines to .bash_profile:

    if [ -f ~/.bashrc ]; then
       source ~/.bashrc
    fi
    




