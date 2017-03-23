# Need a shortcut that inserts the current date/time?

(If you keep a journal -- recommended! -- or a todo file -- also recommended! -- then you'll need this.)

The command is found here:

    TextFX | TextFX Insert | Date & Time Long Format


(You may need to install the TextFX characters plugin) (or update it!)

Next you need to map a key-combination to it.


I'm going to use Ctrl -D

Currently Ctrl-D copies the current line.

I've often hit that combo and i've never needed it.

So Ctrl D for Date.

Under:


Remove this one....

Under:


    Settings | Shortcut Mapper | Scintilla Commands

    Name:  16 SCI_SELECTIONDUPLICATE
    ShortCut: CTRL+D


You can't delete the command, you need to modify it to have no hotkey combo.
	
Use "Modify" -- then on the modify dialog, select a key combination of "None" and press "Apply".	

A warning message will appear saying "This will remove the accelerator!"  Great! Don't forget to press "Apply". Just pressing OK is not enough. Strangely.
	
Removed that one? Great.

Now ADD the one you want. Under:

    Settings | Shortcut Mapper | Plugin Commands:    
    
    Name:       I:Date & Time - long format 
    ShortCut:   Ctrl+D
	


	
	
## See also

 * [Plugins for Notepad++](plugins.md)
 * [Install TextFX plugin to notepad++](install_textfx_plugin.md)