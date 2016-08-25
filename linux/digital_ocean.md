#Developing .net core app and deploying to linux at digital ocean.

materials you will need:

 * your own domain name already purchased. (suggest gandi.net)
 * $5 per month to pay digital ocean
 * need a local machine on which you will do your development. (i'll assume local machine is windows though it could easily be osx or linux)

Prepare your digital ocean account

1. sign up at digital ocean.
2. use PuTTYgen to create SSH keypair
3. tell digital ocean about your public key.

Create and configure your droplet

3. create a droplet at digital ocean. Must be 64 bit (.net core does not run in 32 bit linux). Would currently be Ubuntu 16.
    -tell it to use the SSH key you already provided it with.  
4. use PuTTY to connect to your droplet as root.


 * create a new user
 * give that user sudo privileges
 * test that the new user can connect through SSH.
 * test that the new user can use sudo privileges.
 * stop the root user from being able to connect.
 * install and configure fail2ban
 * customize your bash profile (totally unnecessary, but fun!!)
 * install .net core on your droplet
 * build a helloworld console app
 * test your helloworld console app
 * install sftp
 * create /opt/websites/ -- this is the folder where you will upload your web applications
 * create a new user who will have limited privileges such as uploading files.
 * give the new user permissions to read and write the /opt/websites/ area.

on your local machine:

 * use filezilla to connect to your droplet, as your file uploading user. 
 * verify that you can download/upload files
 * create a new .net core app
 * customize its port number. (this will be handy if you want to host more than 1 app in your droplet)     
 * publish it using dotnet publish
 * upload the publish content to your droplet
 * install nginx
 * configure nginx to act as a reverse proxy to your site
 * dotnet yoursite.dll
 * visit your ipaddress... see that the site is returned
 * configure nameservers at your domain name registrar
 * setup domain records at digital ocean (a record, cname)
 * configure nginx to expect the domain name
 * install supervisor
 * configure supervisor to keep your app running
 * use pingdom or "cake status" to monitor your site(s).


## Sources

 * <http://benfoster.io/blog/how-to-configure-kestrel-urls-in-aspnet-core-rc2>