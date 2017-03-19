# Overcoming "No authentication handler is configured to handle the scheme: Identity.Application"


This error:


    InvalidOperationException: No authentication handler is configured to handle the scheme: Identity.Application
    


For me, it was because in:

    public void Configure
        
        
I had left out:

    app.UseIdentity();

    
(Which does just before `app.UseMvc(routes =>`

## Further reading

 * [One of the answers at: "No authentication handler is configured to handle the scheme: Automatic"](http://stackoverflow.com/a/33989656/49)