# How much memory is free?

A common way...

    $ top


Also

    $ free -m
                  total        used        free      shared  buff/cache   available
    Mem:            488         228          23          11         236         217
    Swap:             0           0           0

The figure under "available" is how much is "Free and available"

i.e. what humans usually mean when they say "free"
    
    
To watch it as it changes...    

    $ watch -n 5 free -m
    
This will refresh every 5 seconds.


Another techinique:

    $ cat /proc/meminfo | grep MemAvailable

    MemAvailable:     223336 kB

And similarly:
    
    $ watch -n 5 'cat /proc/meminfo | grep MemAvailable'
    
To see a lot of specific info about your machine...

    $ sudo lshw

## See Also

    * [Linux Ate My Ram](http://www.linuxatemyram.com/)
