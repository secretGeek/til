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

Or you can look at *ALL* the available commands by typing simply:

    Get-Command


## What can I do with this object?

To find out what you can *do* with an object, any object, use `Get-Member`

	dir | Get-Member

This shows you all the members (properties and methods) of the objects return by `dir`.

You can then look at the different members, and see which ones you are interested in.

e.g. I look at the output of the command above and decide I want to see the "FullName" -- so I run:

	dir | % FullName

This means: run the `dir` command, send the output to a foreach (%) and return the `FullName` property for each object.

So `Get-Member` is one of the fundamental ways you teach yourself about powershell.



## About_Signing

set-executionpolicy 

powershell.exe -ExecutionPolicy bypass

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser


Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser






If you want more help on a command you can type:

    Help dir
