# Javascript function to generate a guid

As seen at [HotGuids](http://www.secretgeek.net/hotGuids/index.htm)



	function S4() {
	   return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	}
	function guid() {
	   return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
	}
	
Or as a one liner....

	
	
	function guid() {
	   return ((((1+Math.random())*0x10000)|0).toString(16).substring(1)+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+"-"+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+"-"+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+"-"+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+"-"+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+(((1+Math.random())*0x10000)|0).toString(16).substring(1));
	}

Or as a NimbleText snippet....



	<% ((((1+Math.random())*0x10000)|0).toString(16).substring(1)+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+"-"+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+"-"+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+"-"+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+"-"+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+(((1+Math.random())*0x10000)|0).toString(16).substring(1)+(((1+Math.random())*0x10000)|0).toString(16).substring(1)) %>
	
(TODO: Embed a newGuid() function in NimbleText)

....ah, that's "guid-like" but it's not really a guid.

Here's a better one:


	function uuidv4() {
	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
		return v.toString(16);
	  });
	}


Puts a 4 and a "(r & 0x3 | 0x8)" right where guid type 4 expects it.

