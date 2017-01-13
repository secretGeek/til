# Rename with Force

You want to rename a file, but the new file already exists.

    ren file.old file.new
    ren : Cannot create a file when that file already exists.

(ren is an alias for `Rename-Item`)
    
You think "I know, I'll use (the) force!"

    ren file.old file.new -Force
    ren : Cannot create a file when that file already exists.

But that doesn't work either....

You google and feel like a fool, but eventually determine you need to use `Move-Item`

    mv file.old file.new -Force

Q.E.D.

