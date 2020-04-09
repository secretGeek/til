# Node Package Manager -- some notes for beginners.

You are in a folder, doing some things. You suddenly decided you want to install an existing package. I'll choose `lodash` because it's the most popular package, the closest thing to a common library.

    npm install lodash
    
...it does a bunch of stuff....

and then spits out these warnings:


    npm WARN ENOENT ENOENT: no such file or directory, open 'C:\Users\Leon\npm_examples\hello1\package.json'
    npm WARN EPACKAGEJSON hello1 No description
    npm WARN EPACKAGEJSON hello1 No repository field.
    npm WARN EPACKAGEJSON hello1 No README data
    npm WARN EPACKAGEJSON hello1 No license field.

They are just warnings -- so it did go ahead and install the package.

`ENOENT`, by the way, means "Error No Entry"


Here's what's been created, in terms of folders...

    hello1
    +---node_modules
        +---lodash
            +---fp
            +---internal

And there's 520 files!


But back to those warnings:


    npm WARN ENOENT ENOENT: no such file or directory, open 'C:\Users\Leon\npm_example\hello1\package.json'
            
There's no package.json file.... 

And the next four warnings:

    npm WARN EPACKAGEJSON hello1 No description
    npm WARN EPACKAGEJSON hello1 No repository field.
    npm WARN EPACKAGEJSON hello1 No README data
    npm WARN EPACKAGEJSON hello1 No license field.

All say "There's a bunch of missing attributes in the file that's missing."


So what? Why do we need these attributes? And why do we need a package.json file?

First -- let's create a package.json file and see if that helps at all.

I add an empty file called package.json and I now get these additional warnings:


    npm WARN EJSONPARSE Failed to parse json
    npm WARN EJSONPARSE No data, empty input at 1:1
    npm WARN EJSONPARSE
    npm WARN EJSONPARSE ^

Okay okay. I update the file Package.json to contain simply: `{}`

Now when I try `npm install lodash` I only get these 3 warnings:

    npm WARN EPACKAGEJSON hello1 No description
    npm WARN EPACKAGEJSON hello1 No repository field.
    npm WARN EPACKAGEJSON hello1 No license field.

It makes sense that the warning about "no such file or directory, open '...\package.json' is gone.

But why is the warning about 

    npm WARN EPACKAGEJSON hello1 No README data

...also gone? 

npm is saying... well you're making an effort. But really npm, we're *not* making an effort. We haven't provided any README data. We've just provided an empty package object. So the 'No README data' error should've stayed. But I digress.

On to the remaining warnings: what are they all about?

    npm WARN EPACKAGEJSON hello1 No description
    npm WARN EPACKAGEJSON hello1 No repository field.
    npm WARN EPACKAGEJSON hello1 No license field.

This is essentially npm saying:

> I see you're doing some npm related stuff in the current folder.... well, you better not think about publishing your current folder as a package. It's looking mighty shoddy. There's no description. No repository field. No license field. Allow me to summarize: as a package, your current folder STINKS!

Why would `npm` be telling us that? It's as if you walk into a bar, in search of a drink, and the bartender says "You're a shitty employee, we don't hire drunks!" But you don't want to work there, you're there to get a drink! What kind of a crazy judgemental bartender is this `npm` guy?

So, what we have to do is either populate our `package.json` file with a description, with repository details and with license details. (I'll show you how to do that in a moment). Or we can update our `package.json` file to say:

    { "private":"true" }

That means: 

>"This folder is just a private piece of code... I'm NOT planning to publish it to the world, so get the HELL OFF MY CASE, npm, you intrusive, weird, bully."

Now &mdash; what if the current package is not intended only for private use. Then we need to know how to populate the missing attributes.

Here's an example of starting `package.json` that contains just the attributes that are causing warnings:

    {                                                             
      "description": "a simple example",                          
      "repository": {                                             
        "type": "git",                                            
        "url": "git+ssh://git@github.com/secretgeek/example2.git" 
      },                                                          
      "license": "MIT"
    }                                                             

But there's a much neater trick for populating our `package.json`. We can use the command:

    npm init
    
This will run through a quick tutorial that builds a `package.json` for us.

    This utility will walk you through creating a package.json file.
    It only covers the most common items, and tries to guess sensible defaults.

    See `npm help json` for definitive documentation on these fields
    and exactly what they do.

    Use `npm install <pkg> --save` afterwards to install a package and
    save it as a dependency in the package.json file.

    Press ^C at any time to quit.
    name: (hello1) &larr;[Cursor is here, awaiting your import]

You will end up with something like this:


    {
      "name": "example",
      "version": "1.0.0",
      "description": "a simple example",
      "main": "index.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "repository": {
        "type": "git",
        "url": "git+ssh://git@github.com/secretgeek/example2.git"
      },
      "keywords": [
        "infinity"
      ],
      "author": "leon bambrick",
      "license": "MIT",
      "bugs": {
        "url": "https://github.com/secretgeek/example2/issues"
      },
      "homepage": "https://github.com/secretgeek/example2#readme"
    }
