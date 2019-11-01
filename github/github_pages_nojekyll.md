# github pages: stop it from using jekyll

Sometimes github pages gets into a weird mode where it wants to use jekyll, and doesn't know what theme to use, or, straight up refuses to serve my simple static html pages and returns a 404 page for everything...

i found the way to get around this is to create a file called

	.nojekyll

0 bytes, empty file... but it does the job.

Also remember that to enable github pages you go into settings for the repo and scroll down down down.