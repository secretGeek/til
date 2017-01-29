# Getting started with Powershell -- the first five minutes.

The first five minutes with powershell are the hardest. After that it's all easy.

## First try some familiar commands

Classic commands from windows shell and from DOS, and from other environments appear to work just fine in PowerShell.

For example you an type:

    dir
    
And see a list of the files in the current directory.

(If you're a linux user, you can also type `ls` and see the same result.)

What's happening here? Is `dir` a command in powershell? No, it's an `alias`, provided for convenience. 

If you type `alias dir` you will see the real name of the command you are calling...


    > alias dir

    CommandType     Name                                                Definition
    -----------     ----                                                ----------
    Alias           dir                                                 Get-ChildItem

Ah-ha!, so `dir` is an alias for `Get-ChildItem`. 

Now, given an alias you can find the underlying command. And you've seen that commands are named like this: Get-ChildItem, i.e. Verb-Noun. So you can often make a good guess at the name of a command. 

## Finding commands, working out what they return

You can look for commands by name or alias, using 'Get-Command', e.g.

    Get-Command Get-ChildItem

Or you can looks at *ALL* the available commands by typing simply:

    Get-Command


Get-Member


About_Signing

set-executionpolicy 

powershell.exe -ExecutionPolicy bypass

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser


Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser






If you want more help on a command you can type:

    Help dir
