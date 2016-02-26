# To Set An Alias:

    set-alias -name gito -value git_off


# Aliases can't have parameters

in bash, an alias can include parameters. Not so in powershell. It's just an abbreviation.

to create an alias with parameters you're advised to create a function in your $PROFILE.

e.g.

    function tf() {
        tree /f
    }

# See if there's any alias for a command...

Often you know the alias and not the command.

e.g.
    get-alias "dir"

... teaches you that dir is an alias for "get-childitem"

Sometimes the opposite is true.

e.g. I wasn't sure what alias to use instead of the cumbersome "push-location"

    get-alias -definition "push-location"

or, shorter:

    get-alias -def "push-location"

shortest:

    gal -def push-loc*



btw. Here's what my first, most cumbersome attempt looked like:

    alias | % { if($_.definition -eq "push-location") {$_} }

...aha! pushd.


