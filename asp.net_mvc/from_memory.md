# Handy Cache helper method

I love this little thing.





    public static T FromMemory<T>(string Key, Func<T> func, double days = 7) where T : class
    {
        var value = MemoryCache.Default.Get(Key) as T;
        if (value == null)
        {
            value = func();
            if (value != null)
            {
                MemoryCache.Default.Add(Key, value, DateTime.Now.AddDays(days));
            }
        }

        return value;
    }
    
    
Then, instead of simply retrieving something from storage, e.g.


    var items = LoadSiteMap();
    
You do this slightly awkward, but fairly clean alternative:

    
    var items = Latest.FromMemory("SiteMap", () => LoadSiteMap());
    
You do have to tell it the cache_key to use.

You can override the default duration to hold it in memory...
    
    var items = Latest.FromMemory("SiteMap", () => LoadSiteMap(), 0.1);

And if things go really pear shaped, and it can't infer the types, you might need to specify them, for example here:

    var items = Latest.FromMemory<List<ISitemapItem>>("SiteMap", () => LoadSiteMap(), 0.1);
