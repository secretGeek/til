## chmod - and the magic of file permissions

    $ chmod 777 /opt/webapps
 
Causes these permissions:

    drwxrwxrwx
    
How is this true? What does this mean?

 777 -- three digits, each digit is the value of 3 flags, 3 bits.
 
7, in binary, is 111. 
 
Each digit refers to three different groups:

This 

    drwxrwxrwx

...can be broken out into 4 categories:

    d  rwx   rwx   rwx
   
Concentrate on those last three, the repeated 'rwx's...

     +---------------  Permissions of the owner of the file,
     |     +---------  The group associated with the file, and
     |     |     +---  Everybody else.
     |     |     |
    rwx   rwx   rwx
    |||   |||   |||
    |||   |||   ||+-- execute permission for everybody else
    |||   |||   |+--- write permission for everybody else
    |||   |||   +---- read permission for everybody else
    |||   |||
    |||   ||+-- execute permission for the group associated with the file
    |||   |+--- write permission for the group associated with the file
    |||   +---- read permission for the group associated with the file
    |||   
    ||+-- execute permission for the owner of the file
    |+--- write permission for the owner of the file
    +---- read permission for the owner of the file
       
r = read permission
w = write permission
x = execute permission

If a permission was missing it would be represented by a dash '-'.  


   
 * `chmod` - modify permissions
 * `chown` - change the owner of the file
 * `chgrp` - change the group  

