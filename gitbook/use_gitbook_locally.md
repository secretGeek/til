# use gitbook locally

You can also generate a gitbook and preview it locally.

First install gitbook (via [npm](../npm/01_summary.md)). 

    npm install -g gitbook


Wait... you now need the `cli` package:

	npm install -g gitbook-cli


Infact....

	You need to install "gitbook-cli" to have access to the gitbook command anywhere on your system.
	If you've installed this package globally, you need to uninstall it.
	>> Run "npm uninstall -g gitbook" then "npm install -g gitbook-cli"
    
Once `gitbook-cli` is installed, thereafter, from the root of the repo you're working on, you run...

    gitbook build .

And it will generate a subfolder called "_book" which contains "index.html" and all the other html of the finished book.

(You may want to add _book to your .gitignore) 

You can view that _book\index.html file directly in a browser, or serve the content locally from a mini webserver by running:

    gitbook serve .

And then browse to (probably) 

    http://localhost:4000/

(you can serve on a different "--port" e.g. `gitbook serve . --port 4003`)


You can output as `html`, `pdf`, `epub` or `mobi`. 

    gitbook help

## See Also

 * [Getting started with gitbook](getting_started_with_gitbook.md)
 * [To have your gitbook updated whenever you push to a github repo](web_hooks.md)
 * [Host a gitbook on a custom subdomain](host_on_custom_subdomain.md)

