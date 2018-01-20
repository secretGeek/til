# git equivalent of hg outgoing

Well this took a while to find.

In mercurial you can see what work you've committed locally that hasn't been pushed by running:

	hg outgoing
	
In git, the nearest equivalent is:

	git log --branches --not --remotes=origin
	
If you want to allow this command to be run as `git outgoing` then add it to your `~\.gitconfig` file in the `[alias]` section like so:

	[alias]
		outgoing = !git log --branches --not --remotes=origin
		out = !git log --branches --not --remotes=origin
		

^^ I added an alias of `out` as well since that's what I normally use. (git doesn't try to coerce your abbreviated commands into real commands the way mercurial does.)

Others says that this is the nearest equivalent to a 'hg outgoing' --

	git fetch && git log FETCH_HEAD..		

...But that performs a `fetch` (same as a `hg pull`) and thus alters your local repo.