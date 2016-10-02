# Developing .net core app and deploying to linux at digital ocean.

materials you will need:

 * your own domain name already purchased. (suggest <http://gandi.net> as registrar)
 * $5 per month to pay digital ocean
 * need a local machine on which you will do your development. (i'll assume local machine is windows though it could easily be osx or linux)

With any articles mentioned below: be sure to read the comments. Sometimes they highlight common problems that people have, or shortcomings/errors in the article that haven't been corrected yet.
 
 
Prepare your digital ocean account

1. sign up at digital ocean.
2. use PuTTYgen to create SSH keypair
3. tell digital ocean about your public key.

Create and configure your droplet

3. create a droplet at digital ocean. Must be 64 bit (.net core does not run in 32 bit linux). Would currently be Ubuntu 16.
 * tell it to use the SSH key you already provided it with.  
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
 * publish it using `dotnet publish` (from the folder that contains the `project.json` file. The published content will end up in the `bin\Debug\netcoreapp1.0\publish\` subfolder)
 * upload the published content to your droplet
 
on your droplet:
 
 * install nginx
 * configure nginx to act as a reverse proxy to your site 
 * run your site in a console. (dotnet `yoursite.dll`)

from a browser: 

 * visit your ipaddress... see that the site is returned
 * configure nameservers at your domain name registrar
 * setup domain records at digital ocean (a record, cname)
 
on your droplet: 

 * configure nginx to expect the domain name
 * install supervisor
 * configure supervisor to keep your app running

from a browser:
 
 * use pingdom or "statuscake" to monitor your site(s).

 
 
## Here was my preliminary list....



### STEP ONE: THE MUST-HAVES

 * Review the [Ubuntu 14.04 server checklist](https://www.digitalocean.com/community/tutorial_series/new-ubuntu-14-04-server-checklist) which covers:
   * [Initial Ubuntu server setup](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04) tutorial with step-by-step configuration instructions, and
   * Connecting to your Droplet with [SSH](https://www.digitalocean.com/community/tutorials/how-to-connect-to-your-droplet-with-ssh).
 * Use DigitalOcean's DNS to [set up your hostname](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-host-name-with-digitalocean) from the Control Panel.
 * Protect your servers by reviewing these [7 security measures](https://www.digitalocean.com/community/tutorials/7-security-measures-to-protect-your-servers).
 * Keep your data safe with an effective [backup strategy](https://www.digitalocean.com/community/tutorials/how-to-choose-an-effective-backup-strategy-for-your-vps).
    
### STEP TWO: WEB SERVERS

 * [Install the powerful Nginx](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-14-04-lts) web server on Ubuntu
 * [Use Nginx virtual hosts](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-14-04-lts) to serve multiple sites on one server. 

### EXTRA CREDIT: SECURE FILE TRANSFER

 * Securely transfer files to your server and between droplets [using SFTP](https://www.digitalocean.com/community/tutorials/how-to-use-sftp-to-securely-transfer-files-with-a-remote-server).

     

## Sources

 * <http://benfoster.io/blog/how-to-configure-kestrel-urls-in-aspnet-core-rc2>
 * [install .net core on ubuntu](https://www.microsoft.com/net/core#ubuntu)
 * [How to set up a host name with digital ocean](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-host-name-with-digitalocean)
 * [chmod](https://en.wikipedia.org/wiki/Chmod)
 * [.net core in production on linux (covers nginx, supervisord)](https://docs.asp.net/en/latest/publishing/linuxproduction.html)
 * [How To Set Up Nginx Server Blocks (Virtual Hosts) on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
 * [How To Use Filezilla to Transfer and Manage Files Securely on your VPS](https://www.digitalocean.com/community/tutorials/how-to-use-filezilla-to-transfer-and-manage-files-securely-on-your-vps)
 * [How To Protect SSH with Fail2Ban on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-14-04)
 * [Initial Server Setup with Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04)
 * [Uncomplicated FireWall (ufw) on ubuntu](https://help.ubuntu.com/12.04/serverguide/firewall.html)
 * [Publishing an ASP.NET Core website to a cheap Linux VM host](http://www.hanselman.com/blog/PublishingAnASPNETCoreWebsiteToACheapLinuxVMHost.aspx)