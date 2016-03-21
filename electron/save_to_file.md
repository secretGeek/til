# Saving to a file

    var win = ...;  // BrowserWindow in which to show the dialog
    const dialog = require('electron').dialog;
    console.log(dialog.showOpenDialog({ properties: [ 'openFile', 'openDirectory', 'multiSelections' ]}));

    dialog.showOpenDialog([browserWindow, ]options[, callback])    
    dialog.showSaveDialog([browserWindow, ]options[, callback])

For both of these methods, the info about their parameters is the same.    
    
`options` is an object containing:

 * title String
 * defaultPath String
 * filters Array
 * properties Array - Contains which features the dialog should use, can contain:
    * openFile, 
    * openDirectory, 
    * multiSelections and 
    * createDirectory
    
    
The filters specifies an array of file types that can be displayed,    
    

for example:

    {
      filters: [
        { name: 'Images', extensions: ['jpg', 'png', 'gif'] },
        { name: 'Movies', extensions: ['mkv', 'avi', 'mp4'] },
        { name: 'Custom File Type', extensions: ['as'] },
        { name: 'All Files', extensions: ['*'] }
      ]
    }

    
## Source

 * https://github.com/atom/electron/blob/master/docs/api/dialog.md