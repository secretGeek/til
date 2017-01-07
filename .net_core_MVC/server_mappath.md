# Server.MapPath

Well well well. This was certainly a fun thing to do back in the good old days wasn't it now:

    HttpContext.Current.Server.MapPath("~/")

But we don't does that no more, does we now.

Instead we injects a hosting environment...

    private readonly IHostingEnvironment _hostingEnvironment;

    public MyController(IHostingEnvironment hostingEnvironment)
    {
        _hostingEnvironment = hostingEnvironment;
    }

...which uses:

    using Microsoft.AspNetCore.Hosting;

Then in our method we can very simply say:

    
    var rootPath = _hostingEnvironment.WebRootPath;
    var parentPath = Directory.GetParent(rootPath).FullName;
    
              
  