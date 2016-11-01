# IP Address

In asp.net full-fat version you could do this:

    Request.UserHostAddress

Now you must do this:

    Request.HttpContext.Connection.RemoteIpAddress.ToString()

But hey, it's kinda cool, because `Request.HttpContext.Connection.RemoteIpAddress` is a real object...

It's of the abstract type 'IPAddress' which is a fun little class, resembling as it does the general result you would achieve if you ate a whole box of 'IPv6' and then vomited all over the editor.

But... alas... when using Kestrel and a forwarding web server (such as nginx) you will find that

    Request.HttpContext.Connection.RemoteIpAddress.ToString() == "127.0.0.1"
    
ALL the time, which is not what you wanted to see. (Or it could be "::1" which is no better)

This is because original IP request is terminated by `nginx`, and a new request is sent to your application. Instead if we configure nginx to put the original IP into a request header, and we look at that request header, then we will see the original remote IP address of the caller. Here's the nginx config details...


    proxy_set_header X-Real-IP $remote_addr;

(See article on [nginx](../linux/nginx.md) to work out exactly where to put that)    
 
 In .net core MVC you can then:


    var ipaddress = Request.HttpContext.Connection.RemoteIpAddress.ToString();
    
    if (Request.Headers["X-Real-IP"].Count() > 0)
    {
        ipaddress = Request.Headers["X-Real-IP"];
    }

    
## See Also

 * [nginx](../linux/nginx.md)