# Get (or list) processes

The `ps` command lists processes.

In order to restart an asp.net core process I first need to work out which process I am interested in. For this I use:

    $ ps aux | grep dot
    leon     17204  2.9 22.6 7135168 113072 ?      SLl  07:17   0:06 /usr/bin/dotnet /opt/webapps/secretgeek.net/app/secretgeek.net.dll
    leon     17233  4.1 26.4 7136456 132108 ?      SLl  07:17   0:07 /usr/bin/dotnet /opt/webapps/wiki.secretgeek.net/app/sniki.dll

Then i can kill the one i want to kill... for example 17233

   sudo kill 17233
   
Or, with less typing...

   ps x | grep dot

Here's a quick guide...

   ps aux

where...

   a    means "all with tty, including other users"
   u    means "user-oriented format"
   x    means "processes without controlling ttys"
    
To learn these things about the `ps` command I used these help commands...

    ps --help
    ps --help simple
    ps --help output
