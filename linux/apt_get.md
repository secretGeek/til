# apt-get package management

to list all packages installed locally...


    dpkg --get-selections | grep -v deinstall

or, simply:

    dpkg -l
 
 
To update apt-get...

    sudo apt-get update


To install somethink...

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

Then you may perform an upgrade, with `sudo apt-get -u upgrade --assume-no` as above.


After performing an upgrade, you may have messages like this:


    The following packages have been kept back:
      linux-headers-generic linux-headers-virtual linux-image-virtual linux-virtual snapd
      ubuntu-core-launcher
    0 upgraded, 0 newly installed, 0 to remove and 6 not upgraded.


What is this 'kept back' business?

It means that some of the packages were not upgraded, because their dependencies would've needed to be upgraded too.

You can either

http://askubuntu.com/questions/601/the-following-packages-have-been-kept-back-why-and-how-do-i-solve-it/185402#185402


