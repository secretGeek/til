# What happened to UrlParameter.Optional ?

instead of UrlParameter.Optional, you use the ? in the template to indicate an optional parameter

e.g. instead of:

    routes.MapRoute(
        name: "Items",
        url: "items/{resource}",
        defaults: new { controller = "Root", action = "Items", resource = UrlParameter.Optional }
    );

simply....


    routes.MapRoute(
        name: "Items", 
        template: "items/{resource?}", 
        defaults: new { controller = "Root", action = "Items" }
    );
    


## Source

 * <http://stackoverflow.com/questions/27799533/migrating-asp-net-mvc-routes-to-asp-net-vnext>