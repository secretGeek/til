# apt-get package management

to list all packages installed locally...


    dpkg --get-selections | grep -v deinstall

or, simply:

    dpkg -l


To update apt-get...

    sudo apt-get update

^^ This updates/improves the list of sources from which packages can be selected.

To install a package, for example a package called "unzip"...

    sudo apt-get update
    sudo apt-get install unzip

To check if any packages need to be updated....

    sudo apt-get -u upgrade --assume-no

(If you leave off the ` --assume-no` then it will prompt you to upgrade, and will default to Y)

To upgrade packages

    sudo apt-get upgrade


When asked:

    Do you want to continue [Y/n]

The capital 'Y' means it is the default. So for 'Yes' just press enter.


If your machine says something like:

    27 packages can be updated.
    14 updates are security updates.

Then you can see which packages need to be upgraded, with:

    sudo apt-get update
	sudo apt-get -u upgrade --assume-no

If you want to upgrade them (hint: you *do*) then go with:

    sudo apt-get update
	sudo apt-get upgrade

After performing an upgrade, you may have messages like this:


    The following packages have been kept back:
      linux-headers-generic linux-headers-virtual linux-image-virtual linux-virtual snapd
      ubuntu-core-launcher
    0 upgraded, 0 newly installed, 0 to remove and 6 not upgraded.


What is this 'kept back' business?

It means that some of the packages were not upgraded, because their dependencies would've needed to be upgraded too and this would've resulted in *NEW* packages.

There are (briefly) three commands you can use to release these "kept back" packages:

	sudo apt-get dist-upgrade				# upgrades and installs all new packages
	sudo apt-get --with-new-pkgs upgrade	# upgrades but lets you choose Y/n for new packages
	sudo apt full-upgrade					# pretty much same as dist-upgrade?? slightly better on edge cases.

The winner is:


    sudo apt-get update
	sudo apt full-upgrade

...less letters. ;)

To update just a single package, and only if it is already installed....

    sudo apt-get update
	apt-get install --only-upgrade <packagename>

e.g.

    sudo apt-get update
	sudo apt-get install --only-upgrade python-certbot-nginx


## Removing unwanted packages....

You may see a message like this....

	The following package was automatically installed and is no longer required:
	  libllvm3.8
	Use 'sudo apt autoremove' to remove it.

Example of the output:

	$ sudo apt autoremove
	Reading package lists... Done
	Building dependency tree
	Reading state information... Done
	The following packages will be REMOVED:
	  libllvm3.8
	0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
	After this operation, 41.6 MB disk space will be freed.
	Do you want to continue? [Y/n]
	(Reading database ... 89955 files and directories currently installed.)
	Removing libllvm3.8:amd64 (1:3.8-2ubuntu4) ...
	Processing triggers for libc-bin (2.23-0ubuntu10) ...


## dpkg was interrupted

Sometimes when running

	sudo apt-get update

You might receive this message:

	dpkg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the problem.

And indeed

	sudo dpkg --configure -a

...does correct the problem.


# dpkg: unrecoverable fatal error

	dpkg: unrecoverable fatal error, aborting:
	fork failed: Cannot allocate memory

Given this problem I thought I might have to increase the size of the memory.

I found that by [rebooting](reboot.md), and re-running the clean up tasks I was attempting I finally succeeded.

First I had to `sudo dpkg --configure -a`

## Sources

* [apt full-upgrade versus apt-get dist-upgrade](https://askubuntu.com/questions/770135/apt-full-upgrade-versus-apt-get-dist-upgrade)
* ["The following packages have been kept back:" Why? And how do I solve it?](http://askubuntu.com/questions/601/the-following-packages-have-been-kept-back-why-and-how-do-i-solve-it/185402#185402)
* [E: dpkg was interrupted… run 'sudo dpkg --configure -a'](https://askubuntu.com/questions/163200/e-dpkg-was-interrupted-run-sudo-dpkg-configure-a)

I haven't accurately captured all of the sources for this.
