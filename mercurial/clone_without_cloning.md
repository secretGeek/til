# clone without cloning

Scenario:

There are mercurial repositories housed on network shares. You want to clone them locally but you know:

1. It will take a while to do the initial clone
2. While the initial clone is happening, the repository will be locked

So the alternative is to:

Copy the repository to your local machine. Either by robocopy or any other method.

	robocopy X:\Repositories\MonoRepo C:\Repos\MonoRepo /MIR

Then edit the `.hg/hgrc` file to refer to the remote location.

You want the hgrc file to say something like this:

	[paths]
	default = X:\Repositories\MonoRepo

i.e. to specify the remote path.