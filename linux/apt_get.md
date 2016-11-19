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

    sudo apt-get -u upgrade

to upgrade packages

    sudo apt-get upgrade


When asked:

        Do you want to continue [Y/n]

The capital 'Y' means it is the default. So for 'Yes' just press enter.

