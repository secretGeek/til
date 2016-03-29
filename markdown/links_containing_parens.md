# Links containing parens, in Markdown

I'm writing [Your First Product](http://YourFirstProduct.com) (the book, not the website) in markdown. (Okay - the site is mostly written in markdown too, but I digress)... there was a url that ends with a closing parenthesis.

The markdown parser in gitbook did not understand this (although the one in pandoc did). To make it work everywhere I had to encode the parens as %20 and %29 respectively.

So:

    '[reciprocity](http://en.wikipedia.org/wiki/Reciprocity_(social_psychology))'

...linked to:

    http://en.wikipedia.org/wiki/Reciprocity_(social_psychology

...and displayed as:

    'reciprocity)'


Whereas:

    '[reciprocity](http://en.wikipedia.org/wiki/Reciprocity_%28social_psychology%29)'

...worked correctly *and* displayed correctly.

Compare '[reciprocity](http://en.wikipedia.org/wiki/Reciprocity_(social_psychology))' to '[reciprocity](http://en.wikipedia.org/wiki/Reciprocity_%28social_psychology%29)'


**Lesson:** consider encoding ( and ) as %28 and %29 in urls.


## Source

 * http://meta.stackexchange.com/questions/13501/links-to-urls-containing-parentheses
 * http://blog.codinghorror.com/the-problem-with-urls/