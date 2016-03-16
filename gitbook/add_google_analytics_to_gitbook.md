# Add Google Analytics to gitbook

    npm install gitbook-plugin-ga

In the file `book.json` (which you may need to create) --

You can set the Google Analytics tracking ID using the plugins configuration in the `book.json`:

    {
        "plugins": ["ga"],
        "pluginsConfig": {
            "ga": {
                "token": "UA-XXXX-Y"
            }
        }
    }

There is also traffic reporting at gitbook (assuming you've published your book that way)


## Source

 * https://www.npmjs.com/package/gitbook-plugin-ga

## See Also
 * [npm](../npm/01_summary.md)
 * [Add a new site to track in Google Analytics](../google/google_analytics_add_new_site.md)
