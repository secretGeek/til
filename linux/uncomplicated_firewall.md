# Uncomplicated Firewall... how do we set that up?

Just before (or immediately after) you've got nginx installed, it's time to think about getting a firewall in place.

ufw (Ucomplicated FireWall) is just the ticket.

Enable ufw, and allow 80, for inbound http requests, and 22 for SSH, as follows:

    sudo ufw enable;sudo ufw allow 22/tcp;sudo ufw allow 80/tcp

To checkif `ufw` is setting up as expected...

    $ sudo ufw status
    Status: active

    To                         Action      From
    --                         ------      ----
    22/tcp                     ALLOW       Anywhere
    80/tcp                     ALLOW       Anywhere
    22/tcp (v6)                ALLOW       Anywhere (v6)
    80/tcp (v6)                ALLOW       Anywhere (v6)

And for extra info you can try:

    $ sudo ufw status verbose
    Status: active
    Logging: on (low)
    Default: deny (incoming), allow (outgoing), disabled (routed)
    New profiles: skip

    To                         Action      From
    --                         ------      ----
    22/tcp                     ALLOW IN    Anywhere
    80/tcp                     ALLOW IN    Anywhere
    22/tcp (v6)                ALLOW IN    Anywhere (v6)
    80/tcp (v6)                ALLOW IN    Anywhere (v6)


    
And which apps are registered...    
    
    $ sudo ufw app list
    Available applications:
      Nginx Full
      Nginx HTTP
      Nginx HTTPS
      OpenSSH

    
    
Considerations for later...    

    HTTPS connections can be allowed with this command:

    sudo ufw allow https

If you'd rather use the port number, 443, use this command:

    sudo ufw allow 443



 * <https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-14-04>