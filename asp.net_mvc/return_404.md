# Want to return 404 from a method...

It's as easy as 

    return HttpNotFound();

Can also put a message in

    return HttpNotFound("No such puppy");

For other errors, you can throw an exception, e.g.

    throw new HttpException(403, "Disallowed file extension. Only image files are permitted.");

   
Or for 403 &mdash; try this:

    return new HttpUnauthorizedResult(message);

    
And there's this as well...

    return new HttpStatusCodeResult((int)HttpStatusCode.OK);

# Breaking news...

In .net core you do this:

    return NotFound();
    
Or even:

    return NotFound("No such kitten");

    
The comment on this is funny (the comment you see in a tooltip in visual studio)

        // Summary:
        //     Creates an Microsoft.AspNetCore.Mvc.NotFoundResult that produces a Not Found
        //     (404) response.

So on the one hand we're trying to be transport-agnostic, removing 'Http' from the name... on the other hand we still need to let the developer know that this is really 404. So we embed it in the comment. Wink wink.
        
    
