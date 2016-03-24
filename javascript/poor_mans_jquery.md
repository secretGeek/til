# Poor Man's JQuery

What it lacks in flexibility and versatility, it makes up for in brevity. 

    function $(id) {
        return document.getElementById(id);
    }

    
from [slide 44: coding while you commute](http://www.secretgeek.net/higgins/slides_alt_net.html#44)

And here's the slightly less-poor poor man's jquery, updated for browsers in the modern age....


    function $(selectors) {
        return document.querySelectorAll(selectors)
    }
    
Note that this returns an array of elements.     

# External links

 * [You Might Not Need JQuery](http://youmightnotneedjquery.com/)
 * [vanilla-js](http://vanilla-js.com/)

# Source

 * https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelectorAll
 * Suggestion from [George Kinsman](https://github.com/gkinsman)
