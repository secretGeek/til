# Getting started with gitbook

Create a new repo at github. It will need at least 2 files: `Summary.md` and `readme.md`. (The rest of the content of your book will be markdown files, and images, in that same repo)

`Readme.md` is treated as the cover-page/introduction to the book

`Summary.md` is used to build the table of contents. It starts with the line "# Summary" and has a link to everything you want to include.

So it looks like this (for example)

    # Summary

    * asp.net mvc
        * [clear caches](/asp.net_mvc/clear_caches.md)
        * [elmah](/asp.net_mvc/elmah.md)
        * [from memory](/asp.net_mvc/from_memory.md)
        * [helpful error page](/asp.net_mvc/helpful_error_page.md)
        * [return 404](/asp.net_mvc/return_404.md)
        * [serve some static files from mvc but not all](/asp.net_mvc/serve_some_static_files_from_mvc_but_not_all.md)
    * git 
         * [how to git](/git/how_to_git.md)


I generate that file using [pre](https://github.com/secretGeek/pre) though it's easy enough to generate with a bit of powershell.

In [gitbook](https://www.gitbook.com) you sign up, and create a "New Book". 

Tell it the location of your github repo and also set up a webhook so that when the repo is updated gitbook is notified. I documented that bit already: [To have your gitbook updated whenever you push to a github repo](web_hooks.md)

Thereafter, any time you push to your github repo it will be immediately updated on gitbook!

You can also generate a gitbook and preview it locally -- see [use gitbook locally](use_gitbook_locally.md)

(Not recommended: writing/editing the content directly at gitbook.com:  that won't work out over time. Better to use a full repo from the start)

## See Also

 * [To have your gitbook updated whenever you push to a github repo](web_hooks.md)
 * [Use gitbook locally](use_gitbook_locally.md)
 * [Host a gitbook on a custom subdomain](host_on_custom_subdomain.md)


