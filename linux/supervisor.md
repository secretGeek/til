# Supervisor... it keeps your app running!

supervisor is a nice thing. It keeps your app running.

    sudo apt-get install supervisor

Config goes in...

    /etc/supervisor/conf.d/ directory

You might for example add a file helloworld.conf in the required place with content such as

    $ cat helloworld.conf
    [program:helloworld]
    command=/usr/bin/dotnet /home/leon/publish/MvcMovie.dll
    #var/aspnetcore/HelloMVC/HelloMVC.dll
    #directory=/var/aspnetcore/HelloMVC/
    directory=/home/leon/publish/
    autostart=true
    autorestart=true
    stderr_logfile=/var/log/helloworld.err.log
    stdout_logfile=/var/log/helloworld.out.log
    environment=ASPNETCORE_ENVIRONMENT=Production
    user=www-data
    stopsignal=INT


Here's how to view the last 20 lines of the supervisor log, using `tail`

    $ sudo tail -n 20 -f /var/log/supervisor/supervisord.log

...in which you might see it struggle to keep your app running...

Or the last 20 lines of your app's error output...

    $ sudo tail -n 20 -f /var/log/helloworld.err.log

Or the last 20 lines of your app's standard (non error) output...

    $ sudo tail -n 20 -f /var/log/helloworld.out.log


To restart supervisor after you've given it some new configuration:

        service supervisor stop
        service supervisor start

I noticed that supervisor did not successfully restart when I [rebooted my linux](reboot.md) box.


TODO: https://lincolnloop.com/blog/automatically-running-supervisord-startup/


## Sources

 * [Supervisord: Restarting and Reloading](http://www.onurguzel.com/supervisord-restarting-and-reloading/)
