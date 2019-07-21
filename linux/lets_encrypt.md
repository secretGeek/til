# How To Secure Nginx with Let's Encrypt on Ubuntu 16.04

Pre-requisite: Nginx is installed and websites are already configured and running as non-https sites.

## Step 1: Get certbot

Let's Encrypt provide a tool called `certbot` which you need to get.

(Some older instructions call this the letsencrypt tool, and other even older instructions say you need to get the source code of the tool)

	sudo add-apt-repository ppa:certbot/certbot
	sudo apt-get update
	sudo apt-get install python-certbot-nginx

The `certbot` client is now ready to use.


## Step 1: See if you need to update certbot

If you're returning to a server that already has certbot you need to check the version and maybe update certbot.


Check version, e.g.

	$ certbot --version
	certbot 0.31.0

These commands apparently...

	sudo apt update
	sudo apt install software-properties-common
	sudo add-apt-repository universe
	sudo add-apt-repository ppa:certbot/certbot
	# sudo apt install certbot

Okay... i didn't run that last command I used this one instead (results below)

	sudo apt-get install --only-upgrade certbot
	Reading package lists... Done
	Building dependency tree
	Reading state information... Done
	certbot is already the newest version (0.31.0-1+ubuntu18.10.1+certbot+1).
	0 upgraded, 0 newly installed, 0 to remove and 39 not upgraded.



## Step 2: Let HTTPs through your ufw

Assume you're using [ufw](uncomplicated_firewall.md)

Let https through, using the 'Nginx Full' profile

	sudo ufw allow 'Nginx Full'

## Step 3: Install certificates

--before doing this you must ensure nginx is correctly configured for your domain. For example:

* there is a file  /etc/nginx/sites-available/example.com
* it has a line like this: `server_name example.com www.example.com;`
* and you've used `sudo nginx -t` to check your config, and have reloaded nginx config if necessary.

NOW we're ready to create and install certificates...

If you have a domain called 'example.com' then run:

	sudo certbot --nginx -d example.com -d www.example.com

Or for a subdomain:

    sudo certbot --nginx -d blog.example.com

To do a dry run (i.e. to see what would happen without making any changes) you can use the `dry-run` parameter like so:

(for the domain)

	sudo certbot --dry-run --nginx -d example.com -d www.example.com

(for the subdomain)

	sudo certbot --dry-run --nginx -d blog.example.com


(Hmmm, Actually -- that returns:

    --dry-run currently only works with the 'certonly' or 'renew' subcommands ('run')	

)

If you have 3 different domains on the same server, example1, example2 and example3 then run the command 3 times, i.e.:

	sudo certbot --nginx -d example1.com -d www.example1.com
	sudo certbot --nginx -d example2.com -d www.example2.com
	sudo certbot --nginx -d example3.com -d www.example3.com

Here's what happens when you run the command (once)

	$ sudo certbot --nginx -d example.com -d www.example.com
	Saving debug log to /var/log/letsencrypt/letsencrypt.log
	Enter email address (used for urgent renewal and security notices) (Enter 'c' to
	cancel): example@googlemail.com

	-------------------------------------------------------------------------------
	Please read the Terms of Service at
	https://letsencrypt.org/documents/LE-SA-v1.1.1-August-1-2016.pdf. You must agree
	in order to register with the ACME server at
	https://acme-v01.api.letsencrypt.org/directory
	-------------------------------------------------------------------------------
	(A)gree/(C)ancel: A

	-------------------------------------------------------------------------------
	Would you be willing to share your email address with the Electronic Frontier
	Foundation, a founding partner of the Let's Encrypt project and the non-profit
	organization that develops Certbot? We'd like to send you email about EFF and
	our work to encrypt the web, protect its users and defend digital rights.
	-------------------------------------------------------------------------------
	(Y)es/(N)o: n
	Obtaining a new certificate
	Performing the following challenges:
	tls-sni-01 challenge for example.com
	tls-sni-01 challenge for www.example.com
	Waiting for verification...
	Cleaning up challenges
	Deployed Certificate to VirtualHost /etc/nginx/sites-enabled/example.com for set(['example.com', 'www.example.com'])
	Deployed Certificate to VirtualHost /etc/nginx/sites-enabled/example.com for set(['example.com', 'www.example.com'])

	Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
	-------------------------------------------------------------------------------
	1: No redirect - Make no further changes to the webserver configuration.
	2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
	new sites, or if you're confident your site works on HTTPS. You can undo this
	change by editing your web server's configuration.
	-------------------------------------------------------------------------------
	Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 1

	-------------------------------------------------------------------------------
	Congratulations! You have successfully enabled https://example.com and
	https://www.example.com

	You should test your configuration at:
	https://www.ssllabs.com/ssltest/analyze.html?d=example.com
	https://www.ssllabs.com/ssltest/analyze.html?d=www.example.com
	-------------------------------------------------------------------------------

	IMPORTANT NOTES:
	 - Congratulations! Your certificate and chain have been saved at:
	   /etc/letsencrypt/live/example.com/fullchain.pem
	   Your key file has been saved at:
	   /etc/letsencrypt/live/example.com/privkey.pem
	   Your cert will expire on 2017-12-03. To obtain a new or tweaked
	   version of this certificate in the future, simply run certbot again
	   with the "certonly" option. To non-interactively renew *all* of
	   your certificates, run "certbot renew"
	 - Your account credentials have been saved in your Certbot
	   configuration directory at /etc/letsencrypt. You should make a
	   secure backup of this folder now. This configuration directory will
	   also contain certificates and private keys obtained by Certbot so
	   making regular backups of this folder is ideal.
	 - If you like Certbot, please consider supporting our work by:

	   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
	   Donating to EFF:                    https://eff.org/donate-le

In words:

1. First you have to enter a contact email address.
2. Next you have to agree to [these terms (pdf)](https://letsencrypt.org/documents/LE-SA-v1.1.1-August-1-2016.pdf)
3. Answer yes or no to sharing your email address with EFF
4. Choose whether to redirect all non-https traffic to https (more details below)


## Step 3, part 2: About redirecting non-https to https

Regarding this question:

	Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
	-------------------------------------------------------------------------------
	1: No redirect - Make no further changes to the webserver configuration.
	2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
	new sites, or if you're confident your site works on HTTPS. You can undo this
	change by editing your web server's configuration.
	-------------------------------------------------------------------------------
	Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 1


Whether you say no or yes (option 1 or 2) to this question, you can change it later by altering the `nginx` configuration file.

First let's look at what is added to the site's nginx file if you answer NO (option 1)

It adds this *AFTER* everything else INSIDE the server block....

	listen 443 ssl; # managed by Certbot
	ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # managed by Certbot
	ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # managed by Certbot
	include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot

If you want to allow redirect of non-https to https, just add this next (still inside the server block) *no... see [better nginx config ideas here](redirect_www_https.md)*

	if ($scheme != "https") {
	   return 301 https://$host$request_uri;
	} # managed by Certbot

(*See [Use nginx to redirect www and non https to bare https](redirect_www_https.md) for a better final example of nginx config with https and redirecting www to bare url)*)


After changing nginx config -- test it is ok with:

	sudo nginx -t

And reload it with:

	sudo nginx -s reload


Two more steps -- auto-renew of your license and improving your score at SSL labs....

## Step 4: Auto Renew

If you run this command manually it will renew your certificate (if it is less than 1 month before expiry)

	certbot renew --quiet

But *don't* renew them manually. They expire every 3 months, so you absolutely must automate their renewal.

So you can use `cron` to run it automatically.

Your `crontab` file stores all of the jobs you run periodically. You can edit this file with:

	sudo crontab -e

If you've never used crontab before, then the first time you run it it will ask which editor to use:

	$ sudo crontab -e
	no crontab for root - using an empty one

	Select an editor.  To change later, run 'select-editor'.
	  1. /bin/ed
	  2. /bin/nano        <---- easiest
	  3. /usr/bin/vim.basic
	  4. /usr/bin/vim.tiny

	Choose 1-4 [2]: 2

If you're a BASIC like me then choose `nano`

Next it will open `nano` with your empty crontab file (empty apart from explanatory comments)...

Add this line:

	45 2 * * * /usr/bin/certbot renew --quiet

The command will be run 45 minutes after 2am on every day of every month.

So -- we will check daily that all certificates are up to date.

## Step 5: Improve score at SSL Labs

Create a new Diffie Hellman parameter file with a larger key (2048 bits)

	sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

The output will be like this (people said it would take a while but it was done in seconds):


	Generating DH parameters, 2048 bit long safe prime, generator 2
	This is going to take a long time
	..........................................+.........................................................................................................................................................................+..........+..++*++*


In each of your nginx config files that contain a server block, add this line:

	ssl_dhparam /etc/ssl/certs/dhparam.pem;


(example by editing the file with `sudo nano /etc/nginx/sites-available/examplecodesmackdown.com`)

Test and reload the config once more with:

	sudo nginx -t
	sudo nginx -s reload

Test your score at (using your own domain name instead of example.com....) :

	https://www.ssllabs.com/ssltest/analyze.html?d=yourfirstproduct.com&latest

(Maybe need to hit 'clear cache')

Should now score an "A".


## Source

 * [How To Secure Nginx with Let's Encrypt on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04)
 * [How To Secure Nginx with Let's Encrypt on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04)

## See also

 * [uncomplicated firewall](uncomplicated_firewall.md)
 * [nginx](nginx.md)
 * [cron](cron.md)

 
