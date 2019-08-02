# How to show a little arrow glyph after 'target="_blank"' anchors

What I wanted was a visual indication of which urls would open in a new window.

I found a pure css solution, that didn't require altering the html at all.


	a[target="_blank"]:after {
		content: " \2197";
		font-size:0.9em;
	}

This means:

	any a element with 'target="_blank"' 
	should have a small North East arrow after it.
