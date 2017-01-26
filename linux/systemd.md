# SystemD: the basics

Create a .service file here:

    /etc/systemd/system/*.service
    
Enable the service (you need to give it the user's password)

    systemctl enable kestrel-hellomvc.service

Start the service (you need to give it the user's password, again) wtf.

    
    systemctl start kestrel-hellomvc.service

Check the status of the service...

    systemctl status kestrel-hellomvc.service    

    

To view logs:

    sudo journalctl -fu kestrel-hellomvc.service
    

> For further filtering, time options such as --since today, --until 1 hour ago or a combination of these can reduce the amount of entries returned.

    sudo journalctl -fu kestrel-hellomvc.service --since "2016-10-18" --until "2016-10-18 04:00"    
    
## Source

 * [Publish to a Linux Production Environment](https://docs.microsoft.com/en-us/aspnet/core/publishing/linuxproduction)    