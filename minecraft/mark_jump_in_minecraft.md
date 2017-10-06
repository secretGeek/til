# Mark-Jump implemented in python for Minecraft

You can run Python scripts from within minecraft, if you use the right Mods.

And two of the handiest little scripts are "Whereami" and "Teleport".

I wanted to take it a step further and implement a full "Mark-Jump" setup.

## What is mark jump?

I navigate around my windows PC by using a Powershell utility called [MarkJump](https://github.com/secretGeek/markjump/blob/master/markjump.ps1). It's super helpful.

I use `Jump` command to go to a well-known location. I use the `Mark` command to mark my current location as a well-known location. And the `Marks` command to list all well-known locations.

## Mark-Jump in Python for Minecraft


Four files:

 * Mark.py
 * Jump.py
 * Marks.py
 * Unmark.py


## Mark.py
 
	import json
	import os
	from mine import *
	from sys import argv
	mc = Minecraft()

	mc.postToChat("mark mc.player.getTilePos() location as argv[1]")

	if os.path.isfile("marks.json"):
		with open('marks.json') as json_file:  
			marks = json.load(json_file)
	else: 
		marks = {}

	if argv[1] in marks.keys():
		mc.postToChat("That mark already exists. I refuse to overwrite it.")
	else:
		marks[argv[1]] =[mc.player.getTilePos().x, mc.player.getTilePos().y, mc.player.getTilePos().z]
		with open('marks.json', 'w') as outfile:  
			json.dump(marks, outfile)


## Jump.py

	import json
	import os
	from mine import *
	from sys import argv
	mc = Minecraft()

	mc.postToChat("teleport to argv[1]")

	if os.path.isfile("marks.json"):
		with open('marks.json') as json_file:  
			marks = json.load(json_file)
		if argv[1] in marks.keys():
			mc.player.setTilePos(marks[argv[1]][0], marks[argv[1]][1], marks[argv[1]][2])
		else:
			mc.postToChat("No such key as argv[1]. Notes: 1. marks are CASE sensitive or 2. Perhaps you meant 'mark'?")
 
 
## Marks.py

	import json
	import os
	from mine import *
	from sys import argv
	mc = Minecraft()

	if os.path.isfile("marks.json"):
		with open('marks.json') as json_file:  
			marks = json.load(json_file)
			mc.postToChat(", ".join(sorted(marks.keys(), key=lambda s: s.lower())))



## Unmark.py

(I haven't bothered with this one yet)

	import json
	import os

	print("unmark argv[1]")

	with open('marks.json') as json_file:  
		marks = json.load(json_file)	
	#TODO: worry about unmark some other time...
	del marks["a"]

	#todo: write the file now...


## See also

 * [markjump in powershell](https://github.com/secretGeek/markjump)
 * [CRUMBS! Commandline navigation tool for Powershell](http://www.secretgeek.net/crumbs)
 