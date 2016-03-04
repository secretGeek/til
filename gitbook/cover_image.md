# Adding a cover image to a gitbook


## To auto generate a cover...

Add the autocover plugin

    npm install gitbook-plugin-autocover

This failed with:

    gyp ERR! configure error
    gyp ERR! stack Error: Can't find Python executable "python", you can set the PYTHON env variable.

Because:

> Some npm plugins need node-gyp to be installed.
>However, node-gyp has it's own dependencies ([from the github page](https://github.com/TooTallNate/node-gyp))   
><br />&mdash;http://stackoverflow.com/a/21366601/49    
    
in book.json, include `title`, `author`, `plugins` and `pluginsConfig', e.g.

    {
        "title": "Today I Learned",
        "author": "Leon Bambrick",
        "plugins": ["autocover"],
        "pluginsConfig": {
            "autocover": {
              "font": {
                    "size": null,
                    "family": "Impact",
                    "color": "#FFF"
                },
                "size": {
                    "w": 1800,
                    "h": 2360
                },
                "background": {
                    "color": "#09F"
                }
            }
        }
    }    

run `gitbook install`



## sources

 * http://help.gitbook.com/format/cover.html
 * https://github.com/GitbookIO/plugin-autocover