# IP Address

In asp.net full-fat version you could do this:

    Request.UserHostAddress

Now you must do this:

    Request.HttpContext.Connection.RemoteIpAddress.ToString()

But hey, it's kinda cool, because `Request.HttpContext.Connection.RemoteIpAddress` is a real object...

It's of the abstract type 'IPAddress' which is a fun little class, resembling as it does the general result you would achieve if you ate a whole box of 'IPv6' and then vomited all over the editor.

