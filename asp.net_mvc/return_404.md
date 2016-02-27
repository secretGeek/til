# Want to return 404 from a method...

it's as easy as 

    return HttpNotFound();

Can also put a message in

    return HttpNotFound("No such puppy");

For other errors, you can throw an exception, e.g.


    throw new HttpException(403, "Disallowed file extension. Only image files are permitted.");

    
Or for 403 -- try this:

    return new HttpUnauthorizedResult(message);

    
And there's this as well....


    return new HttpStatusCodeResult((int)HttpStatusCode.OK);    