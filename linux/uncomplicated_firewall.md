# Uncomplicated Firewall... how do we set that up?

Just before (or immediately after) you've got nginx installed, it's time to think about getting a firewall in place.

ufw (Ucomplicated FireWall) is just the ticket.

Enable ufw, and allow 80, for inbound http requests, and 22 for SSH, as follows:

    sudo ufw enable;sudo ufw allow 22/tcp;sudo ufw allow 80/tcp


To check if `ufw` is set up as expected...

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



And to see which apps are registered with ufw...

    $ sudo ufw app list
    Available applications:
      Nginx Full
      Nginx HTTP
      Nginx HTTPS
      OpenSSH


Considerations for later...

> HTTPS connections can be allowed with this command:
>
>     sudo ufw allow https
>
> If you'd rather use the port number, 443, use this command:
>
>   sudo ufw allow 443


Simpler one is:


	sudo ufw allow 'Nginx HTTP'

Or, for http and https:

	sudo ufw allow 'Nginx Full'

You can remove those you've already allowed with, for example:

	sudo ufw delete allow 80/tcp

^^ because that's superceded by 'Nginx HTTP' profile

	sudo ufw delete allow 'Nginx HTTP'

^^ because that's superceded by 'Nginx Full' (which allow both http and https)

Might also want to allow 'OpenSSH' something like sudo ufw allow 'OpenSSH' but i'm not sure so I'd stick with

	sudo ufw allow 22/tcp

For now.

Although, checking what application lists are avaible with:

	sudo ufw app list

I see:

  Nginx Full
  Nginx HTTP
  Nginx HTTPS
  OpenSSH

So I expect if i do `sudo ufw allow 'OpenSSH'` then i would be able to delete 22/tcp and still use ssh.

## Source

 * <https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-14-04>

 ## See also

 * [nginx](nginx.md)