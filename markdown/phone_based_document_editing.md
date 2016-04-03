# Editing markdown files from your phone

I want to be able to edit the books I'm writing while traveling without a laptop.

So I've installed an app on my iphone called 'Plaintext 2' which integrates with dropbox.

Then in the folder:

    ~\dropbox\Apps\PlainText 2\

I've placed a copy of the books I want to edit.

To synchronize work from there back into the source repository I'm just going to use SourceGear's DiffMerge (`sgdm.exe`).

So I have two commands ready to go...

Before doing any phone-based work, to make sure the `dropbox\apps` copy is up to date:

    sgdm.exe "~dropbox\secretgeek\projects\YourFirstProduct_ebook" "~dropbox\Apps\PlainText 2\YourFirstProduct_ebook"

After doing any phone-based work:

    sgdm.exe "~dropbox\Apps\PlainText 2\YourFirstProduct_ebook" "~dropbox\projects\YourFirstProduct_ebook"

(I can then cherry pick the changes back into the base repository)

A similar app that is a dedicated markdown editor is 'Clarity'. I may use this instead.