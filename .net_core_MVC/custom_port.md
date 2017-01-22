# Hosting an .net core asp.net mvc web application from a custom port number


Create a file, `hosting.json` in the root of your project that contains:

    {
      "server.urls": "http://localhost:8500"
    }

(But substitute the port number you wish to use in place of 8500)    

In `Program.cs` add a config item that uses that file, and add it as a configuration item to the `WebHostBuilder`, like so:

    public class Program
    {
        public static void Main(string[] args)
        {
            var config = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("hosting.json", optional: true)
                .Build();

            var host = new WebHostBuilder()
                .UseKestrel()
                .UseConfiguration(config)
                .UseContentRoot(Directory.GetCurrentDirectory())
                .UseIISIntegration()
                .UseStartup<Startup>()
                .Build();

            host.Run();
        }
    }



 
In `project.json` ensure `hosting.json` gets included when the file is published, by adding it.

    "publishOptions": {
        "include": [
          "wwwroot",
          "Views",
          "Areas/**/Views",
          "appsettings.json",
          "hosting.json",
          "web.config"
        ]
      },
      
Then `dotnet publish` as usual.

## Source

 * [How to configure Kestrel URLs in ASP.NET Core RC2](http://benfoster.io/blog/how-to-configure-kestrel-urls-in-aspnet-core-rc2) (comments are important there too)
 
 