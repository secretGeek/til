# Git config

Config -- from most least specific to most specific, is stored in these locations:

    ~/.gitconfig -- config for the current user, i.e. $home\.gitconfig
    .git/config -- config for the current repo

Get all config:

    git config --list    
    
Get the user name:

    git config --get user.name
    git config --get user.email    

Set the user name:

    git config user.name "John Doe"
    git config --system user.name "John Doe"
    git config --global user.name "John Doe"
    git config --f user.name "John Doe"