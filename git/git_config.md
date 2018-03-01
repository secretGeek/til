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

(Where `FILE_Name` is the name of the actual file)


Also -- for a given repository, to set the username, you can go into the `.git\config` file and add the username plus an '@' before the url in the 'remote origin' value, e.g.

Change:

    [remote "origin"]
        url = https://github.com/secretGeek/til.git

To:
    [remote "origin"]
        url = https://secretGeek@github.com/secretGeek/til.git

I've only tried that for bitbucket and github. It seems to work, in the sense that when I go to push a commit, I no longer need to enter my user name. All of the other techniques worked in the sense that they were stored, but they were not automatically applied when I went to push to a remote location.

To globally assume a username of secretGeek when pushing to github:

    git config --global url."https://secretGeek@github.com".insteadOf "https://github.com"

To cache passwords (on windows)

    git config --global credential.helper wincred

> This stores your credentials in the Windows credential store which has a Control Panel interface where you can delete or edit your stored credentials. (Under Control Panel\User Accounts\Credential Manager)

(from <https://stackoverflow.com/questions/15381198/remove-credentials-from-git>)

And to stop caching password on windows:

    git config --system --unset credential.helper

Or on linux:

    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=3600'

## External links

 * [Git Configuration from the Pro Git Book](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
 * [Caching your password](https://help.github.com/articles/caching-your-github-password-in-git/#platform-linux)
