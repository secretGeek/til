# Git config

Config -- from least specific to most specific, is stored in these locations:

    $(prefix)/etc/gitconfig -- system-wide config
    ~/.gitconfig -- 'global config' actually config for the current user, i.e. $home\.gitconfig
    .git/config -- config for the current repo

Get all config:

    git config --list    
    
Get the user name:

    git config --get user.name
    git config --get user.email    

Set the user name:

For the current system (i.e. machine) regardless of who is using the machine:    

    git config --system user.name "John Doe"

The setting above will be overridden by any of those below:
    
For the current user (i.e. global) regardless of which repo we are in.
    
    git config --global user.name "John Doe"

The setting above will be overridden by the one below:
    
For just the current repo:

    git config user.name "John Doe"


For a specific file (I haven't used this one)
    
    git config --file FILE_Name user.name "John Doe"


Also -- for a given repository, to set the username, you can go into the `.git\config` file and add the username plus an '@' before the url in the 'remote origin' value, e.g.

Change: 

    [remote "origin"]
        url = https://github.com/secretGeek/til.git

To:
    [remote "origin"]
        url = https://secretGeek@github.com/secretGeek/til.git

(I've only tried that for bitbucket and github)