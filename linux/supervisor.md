# Supervisor... it keeps your app running!

supervisor is a nice thing. It supervises your app to keep it running.

    sudo apt-get update
    sudo apt-get install supervisor

Config goes in...

    /etc/supervisor/conf.d/ directory

To create a new service for supervisor to supervise, add a file, e.g. `helloworld.conf` in the directory mentioned above, with content such as

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


## View supervisor logs...

Here's how to view the last 20 lines of the supervisor log, using `tail`

    $ sudo tail -n 20 -f /var/log/supervisor/supervisord.log

...in which you might see it struggle to keep your app running...

Or the last 20 lines of your app's error output...

    $ sudo tail -n 20 -f /var/log/helloworld.err.log

Or the last 20 lines of your app's standard (non error) output...

    $ sudo tail -n 20 -f /var/log/helloworld.out.log

## Restart supervisor

To restart supervisor after you've given it some new configuration:

        service supervisor stop
        service supervisor start

I noticed that supervisor did not successfully restart when I [rebooted my linux](reboot.md) box.

I restarted it with `service supervisor start` (which required me to type my password)

First though, I checked the status with `service supervisor status`, and saw:

    user1@machine1:~$ service supervisor status
    ? supervisor.service - Supervisor process control system for UNIX
       Loaded: loaded (/lib/systemd/system/supervisor.service; disabled; vendor preset: enabled)
       Active: inactive (dead)
         Docs: http://supervisord.org

Starting it went like this...

    user1@machine1:~$ service supervisor start
    ==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
    Authentication is required to start 'supervisor.service'.
    Authenticating as: user1,,, (user1)
    Password:
    ==== AUTHENTICATION COMPLETE ===

## Check status of supervisor

And now I get this result from `status` --

    user1@machine1:~$ service supervisor status
    ? supervisor.service - Supervisor process control system for UNIX
       Loaded: loaded (/lib/systemd/system/supervisor.service; disabled; vendor preset: enabled)
       Active: active (running) since Thu 2017-04-06 07:19:51 EDT; 4min 19s ago
         Docs: http://supervisord.org
     Main PID: 2795 (supervisord)
        Tasks: 41
       Memory: 275.4M
          CPU: 24.093s
       CGroup: /system.slice/supervisor.service
               +-2795 /usr/bin/python /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
               +-2800 /usr/bin/dotnet /opt/webapps/webapp1/app/app1.dll
               +-2801 /usr/bin/dotnet /opt/webapps/webapp2/app/app2.dll
               +-2802 /usr/bin/dotnet /opt/webapps/webapp3/app/app3.dll

Another way to inspect the status of supervisor:

	systemctl status supervisor.service

Exactly same output as `service supervisor status`...e.g.:

	? supervisor.service - Supervisor process control system for UNIX
	   Loaded: loaded (/lib/systemd/system/supervisor.service; disabled; vendor preset: enabled)
	   Active: active (running) since Mon 2017-09-11 02:00:44 UTC; 1min 27s ago
		 Docs: http://supervisord.org
	 Main PID: 6654 (supervisord)
		Tasks: 41
	   Memory: 207.6M
		  CPU: 14.514s
	   CGroup: /system.slice/supervisor.service
			   +-6654 /usr/bin/python /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
			   +-6659 /usr/bin/dotnet /opt/webapps/yourfirstproduct.com/app/YourFirstProduct.dll
			   +-6660 /usr/bin/dotnet /opt/webapps/codesmackdown.com/codesmackdown.com.dll
			   +-6661 /usr/bin/dotnet /opt/webapps/joy.nimbletext.com/app/Joy.dll

## Make supervisor restart automatically

To restart supervisor on reboot, add something like this to your [crontab](cron.md):


    @reboot	/my/path/to/supervisord -c /my/path/to/supervisord.conf 2>&1
i.e.

    @reboot /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf 2>&1


Add that to your cron jobs using crontab (described in [cron](cron.md)).


## Sources

 * [Supervisord: Restarting and Reloading](http://www.onurguzel.com/supervisord-restarting-and-reloading/)
 * [Protip: Automatically Running Supervisord on Startup](https://lincolnloop.com/blog/automatically-running-supervisord-startup/)

## see also

 * [cron & crontab](cron.md)