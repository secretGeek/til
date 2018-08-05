# Use express webserver to serve local files over http


    npm install express
    

Then create a file, `server.js`, with contents much-like:

    
	var express = require('express');
	var app = express();
	var path = require('path');

	// __dirname will use the current path from where you run this file 
	app.use(express.static(__dirname));
	app.use(express.static(path.join(__dirname, 'C:\\SOME\\Path\\Here')));

	app.listen(8000);
	console.log('Listening on port 8000');

    
(Replacing '`C:\\SOME\\Path\\Here`' with the path that will serve as the root of the 'site', noting double backslashies. In *nix land of course it's all forward slashies.)
    
    
Then start the web server using:

    node server.js
    
And browse to:

    http://localhost:8000/{fileName}
    
(Replacing {fileName} with the path to the file you want to see, relative to the root path)



## Source

  * <http://stackoverflow.com/a/26845720/49> -- user 'thehme'

