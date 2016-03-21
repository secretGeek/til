# Adding a cover image to a gitbook

## To include a cover image (used in the pdf and epub outputs)

Step 1: Create a file called "cover.jpg" with width 1800px and height 2360px, and place it in the root folder of your gitbook.

Step 2: There is no step 2.


(Assuming you are creating it with Paint.net, you'll no doubt make heavy use of [layers](../graphics/paint.net_layers.md), and keep the original `.pdn` file. Inkscape also a distinct possibility.)




## To auto generate a cover...

Tl;dr; Never do this.

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

Anyway if you're only doing 1 or 2 books, it is not burdensome to create the cover yourself manually (or pay a professional!)

If you are bulk creating 1000's of books, I suggest writing your own program/script for generating the cover image, and never using auto cover.

## sources

 * http://help.gitbook.com/format/cover.html
 * https://github.com/GitbookIO/plugin-autocover