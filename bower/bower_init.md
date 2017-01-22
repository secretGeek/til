# bower init

When running a `bower` command (ok, if you must know it was....

    bower install markdown-it --save

)...

the final part of the output said:

    bower    no-json No bower.json file to save to, use bower init to create one

So...

Creating a `bower.json` file with `bower init` is very fun, and reminiscent of `npm init`

After going through the questionnaire I ended up with something like this:

    {
      "name": "A great name",
      "authors": [
        "secretGeek <leon....@gmail.com>"
      ],
      "description": "a messy thing",
      "main": "index.html",
      "keywords": [
        "markdown"
      ],
      "license": "MIT",
      "homepage": "",
      "private": true,
      "ignore": [
        "**/.*",
        "node_modules",
        "bower_components",
        "test",
        "tests"
      ],
      "dependencies": {
        "markdown-it": "^8.2.2"
      }
    }


Note it was smart enough to add what i'd added already as a dependency.

var MarkdownIt = require('markdown-it'),
    md = new MarkdownIt();
var result = md.render('# markdown-it rulezz!');