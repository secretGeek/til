# Secure Copy (scp)


From <http://www.hypexr.org/linux_scp_help.php>

Copy the file "foobar.txt" from a remote host to the local host

    $ scp your_username@remotehost.edu:foobar.txt /some/local/directory

Copy the file "foobar.txt" from the local host to a remote host

    $ scp foobar.txt your_username@remotehost.edu:/some/remote/directory

Copy the directory "foo" from the local host to a remote host's directory "bar"

    $ scp -r foo your_username@remotehost.edu:/some/remote/directory/bar
    
Copy the file "foobar.txt" from remote host "rh1.edu" to remote host "rh2.edu"

    $ scp your_username@rh1.edu:/some/remote/directory/foobar.txt \
    your_username@rh2.edu:/some/remote/directory/
    
Copying the files "foo.txt" and "bar.txt" from the local host to your home directory on the remote host

    $ scp foo.txt bar.txt your_username@remotehost.edu:~

Copy the file "foobar.txt" from the local host to a remote host using port 2264

    $ scp -P 2264 foobar.txt your_username@remotehost.edu:/some/remote/directory

Copy multiple files from the remote host to your current directory on the local host

    $ scp your_username@remotehost.edu:/some/remote/directory/\{a,b,c\} .
    $ scp your_username@remotehost.edu:~/\{foo.txt,bar.txt\} .

## Source

 * [Example syntax for Secure Copy (scp)](http://www.hypexr.org/linux_scp_help.php)