# Adhoc web scraping with jquery

Sometimes you need to grab and format some data from a web page, and regular copy/paste techniques are just not good enough.

For example with a box.com page just now, I found I couldn't click and select text on the page. So this old console-based web scraping trick came in handy.

(I've blogged about the technique previously here: [Extracting a Trello board as markdown](http://www.secretgeek.net/trello_ws))


## Step 1: Check if jQuery is present

In Chrome, Fit F12 to open the developer tools. See if JQuery is loaded, by running a command such as:

	$("body")
	
If you see output like:

	body#site_body.platform-windows.r3, prevObject: he.fn.init(1), context: document, selector: "body"]	

...then you have jQuery. If you see output like this, then JQuery is not loaded;

	Uncaught ReferenceError: $ is not defined

	

	
More often than not, JQuery will be already loaded.

## Step 2: Load JQuery (if necessary)

If JQuery is not present, consider that perhaps [You Might Not Need JQuery](http://youmightnotneedjquery.com/) -- or load it in yourself with this line of code:


	var jq = document.createElement('script');
	jq.src = "//code.jquery.com/jquery-latest.min.js";
	document.getElementsByTagName('head')[0].appendChild(jq);


Give time for jQuery to load, then type:

	jQuery.noConflict();


## Step 3: find the content you want to extract.


Now you need to explore the DOM to find the content you're after.

Look for classes or element hierarchies that can be exploited to isolate the content you're trying to grab.

Run ad-hoc jQuery commands, with various different selectors until you've pinpointed your target. e.g.

    $(".list-item").children();

	
## Step 4: Put it all together

Now wrap it up in a one liner that does what you need. Here's my example from BOX just now:

    var s=[];$(".file.item").each(function() { s.push($(this)[0].innerText)});copy(s.join("\n"));

So -- I create an array, `s`. 

I iterate through all items that match the selector, and push info from each items into my array. 

And then I use the intrinsic console-only command, `copy` to put the result onto the clipboard.


## References

 * [You Might Not Need JQuery](http://youmightnotneedjquery.com/)
 * [Include jQuery in the JavaScript Console](https://stackoverflow.com/questions/7474354/include-jquery-in-the-javascript-console)
 * [Extracting a Trello board as markdown](http://www.secretgeek.net/trello_ws)