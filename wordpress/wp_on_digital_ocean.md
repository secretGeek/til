# Created a new Wordpress droplet at digital ocean


Visiting the url it says:
    Please log into your droplet via SSH to enable your WordPress installation.
    
Logging in via SSH, I get this welcome message:
    

    Thank you for using DigitalOcean's WordPress Application.

    WordPress has now been enabled. You can access your WordPress instance at:
        http://45.55.132.29

    The "ufw" firewall is enabled. All ports except for 22, 80, and 443 are BLOCKED.
    To secure your WordPress installation, fail2ban has been configured and the
    WordPress fail2ban plugin is a site enforce module in. If you do not want to use this
    plugin, remove /var/www/html/wp-content/mu-plugins/fail2ban.

    You are encouraged to run mysql_secure_installation to ready your server for
    production. The passwords for MySQL and the WordPress users have been saved to:
        /root/.digitalocean_password

    Let's Encrypt has been pre-installed for you. If you have a domain name, and
    you will be using it with this 1-Click app, please see: http://do.co/le-apache

    You can learn more about using this image here: http://do.co/wordpressapp
    -------------------------------------------------------------------------------------
    To delete this message of the day: rm -rf /etc/update-motd.d/99-one-click

    The programs included with the Ubuntu system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.