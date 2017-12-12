# Google Chrome: Design Mode = ON let's you edit inline

F12, dev tools -- then enter this in the console

	document.designMode="on";
	
Now you can type on any element of the webpage and change what it says.


You can also create a bookmarklet called 'edit' with this as the URL:

	javascript:document.body.contentEditable='true'; document.designMode='on'; void 0

... and click it at any time to make any page easy to edit.