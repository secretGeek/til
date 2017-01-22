# reboot linux...

When sshing onto my fave droplet...

    27 packages can be updated.
    14 updates are security updates.


    *** System restart required ***

    
To reboot a server from the command line, run:

    sudo shutdown -r now


That ^^ is the preferred method, over the more obvious:
    
    sudo reboot

> Many Unix systems have reboot perform an *instant* reboot &mdash; no syncing, no umounting, nothing. It's just like hitting the reset button    

Though someone counters with....
    
> Judging from the manual pages of both reboot and shutdown, it looks like shutdown provides a bit more lower-level functionality, and reboot is a higher-level tool that uses shutdown.

    
## 

 * [How to reboot droplet through the command line](https://www.digitalocean.com/community/questions/how-to-reboot-droplet-through-the-command-line-restart-apache-server)
 * [reboot vs shutdown -r now for restarting Linux](http://superuser.com/questions/175391/reboot-vs-shutdown-r-now-for-restarting-linux)