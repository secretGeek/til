# Redis GUI - redis desktop manager

Connection dialog asks you for:

    Name
    Host 
    Port 
    Auth (optional)

The connection string from rediscloud looked like this:

    redis://rediscloud:dBWHDNWJHECBJEBCW@pub-redis-12345.us-east-2-5.2.ec2.garantiadata.com:12345

(details changed for security reasons :) )    
    
And that gets broken apart and entered into the connection dialog like this:

> Name: whatever you want<br />
> Host: everything after the @ and before the colon, i.e. pub-redis-12345.us-east-2-5.2.ec2.garantiadata.com<br />
> Port: 12345<br />
> Auth (optional) : everything before the @ and after the colon, i.e. dBWHDNWJHECBJEBCW


After setting up my connection successfully I still found that the app did not work for my redis store containing 120,000 records.

I instead used [redsmin](https://www.redsmin.com/) to connect to it, and verify that my store was still ok, if a little large.

Then I found that:

    redis.DeleteById<Session>("Guess.Models.Session::08ec9f99-eaf9-42b1-879b-755b216422a1");
    
Did *not* work. I don't know why.

However:

    redis.Del("Guess.Models.Session::08ec9f99-eaf9-42b1-879b-755b216422a1")
    
Worked fine. Yay.

Even better, I could pass in a whole array of sessions to delete.

    redis.Del(victims.ToArray());

And now that the store is down to 187 entries (instead of 120,000) redis desktop manager works very nicely.    