# nginx - a web server

nginx overtook apache as the most popular webserver in the world.

what i use it for is as an internet facing webserver that acts as a 'reverse proxy' for my web apps (which themselves run `kestrel`, a lightweight webserver, that isn't robust enough to withstand the open internet)

install via `apt-get`

    sudo apt-get update
    sudo apt-get install nginx

then start the service, if you're interested.

    sudo service nginx start

go and look at the config...

    cd /etc/nginx/
    cat nginx.conf

but the stuff we'll be dealing with mostly is in this folder:

    cd /etc/nginx/sites-available/

If you're only going to host one site, then go ahead and edit the file `default`.

But we're not going to do things the easy way: we're going to host multiple sites from this VM. So...

Make a copy of the file, 'default' and in that file tell us how nginx should pass requests onto your account.
e.g.

    cp default yourdomain.com

then edit the file, via sudo, ...

    sudo nano yourdomain.com


And update it to something like...

    server {
        listen 80;
        root /opt/websites/yourdomain.com/app;
        server_name blog.yourdomain.com; # this is the incoming path that it will recognise...
        location / {
            proxy_pass http://localhost:3000; # this is the local path it will defer to...
            # the port number there is the one we're using for it
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header Connection keep-alive;
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
        }
    }


Now -- we need to create a symbolic link from your newly added file in the sites-available directory to the sites-enabled directory

    sudo ln -s /etc/nginx/sites-available/yourdomain.com /etc/nginx/sites-enabled/
	sudo ln -s /etc/nginx/sites-available/nimbletext.com /etc/nginx/sites-enabled/

to test if your changes are valid...

    sudo nginx -t

Sometimes it says the edits you made were indeed horrible, e.g..

    nginx: [emerg] unexpected "}" in /etc/nginx/sites-enabled/yourdomain.com:86
    nginx: configuration file /etc/nginx/nginx.conf test failed

(I had an extra "}")
	
And another example:

	$ sudo nginx -t
	nginx: [warn] conflicting server name "codesmackdown.com" on 0.0.0.0:80, ignored
	nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
	nginx: configuration file /etc/nginx/nginx.conf test is successful	

(I had two config files that both wanted to be handlers for the `codesmackdown.com` `server_name` ...)	

In which case you need to edit the file and fix it. Then `sudo nginx -t` again to see if the changes are now valid.

Once everything is tickety-boo you'll see:

    $ sudo nginx -t
    nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    nginx: configuration file /etc/nginx/nginx.conf test is successful

So you can tell nginx to go ahead and use this newly crafted and verified configuration...

    sudo nginx -s reload


## About remote_addr

Note, this particular line of config:

    proxy_set_header X-Real-IP $remote_addr;

This is so that inside our application we'll be able to see the original IP Address of the client. The original IP request is terminated by `nginx`, and a new request is sent to our application. So if we read the IPAddress a normal way it will simply say 127.0.0.1 (or ::1). Instead if we look at the request header 'X-Real-IP' we will see the original remote IP address of the caller. In C# I do that like this:


    var ipaddress = Request.HttpContext.Connection.RemoteIpAddress.ToString();

    if (Request.Headers["X-Real-IP"].Count() > 0)
    {
        ipaddress = Request.Headers["X-Real-IP"];
    }



## Tail nginx log

    sudo tail -n 20 -f /var/log/nginx/access.log

## Source

 * <https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04>
 * <https://docs.asp.net/en/latest/publishing/linuxproduction.html>
 * [How To Set Up Nginx Server Blocks (Virtual Hosts) on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04)
 * [NGINX for ASP.NET Core In-Depth](http://rehansaeed.com/nginx-asp-net-core-depth/)

## See also

 * [IP Address in .net core MVC](../.net_core_MVC/ip_address.md)
