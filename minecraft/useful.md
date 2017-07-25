# Useful minecraft scripts (in python)



## Aircube3:

Purpose: carve out a 3 dimensional box of air, centered on your current location. For example if you are underground, run:

	/py aircube3 50 3 50

...to create a long, wide basement. (Parameters are X Y and Z dimensions.

Or 	`/py aircube3 50 3 3` to create a long tunnel in the X direction, 
and: `/py aircube3 3 3 50` to create a long tunnel in the Z direction, 
and:  `/py aircube3 3 50 3` to create a tall tube of air Y direction, 

Here's the file `aircube3.py`:

	from mine import * 
	from sys import argv
	mc = Minecraft()
	mc.postToChat ("Placing a cube of air just for you...")
	playerPos = mc.player.getPos()
	xsize = int (argv[1]);
	ysize = int (argv[2]);
	zsize = int (argv[3]);
	xhsize = int(xsize/2);
	yhsize = int(ysize/2);
	zhsize = int(zsize/2);

	for i in range(xsize):
		for j in range (ysize):
			for k in range (zsize):
				mc.setBlock(playerPos.x +i - xhsize, playerPos.y +j - yhsize , playerPos.z +k - zhsize, block.AIR)

## Lightup:

Put lights all over the place, so you can see what's going on. Useful in caves.

(Alternative technique is to use a `night vision` potion, but I still prefer this little script)

Use it like this: 
	/py lightup

Here's the script `lightup.py`

	from mine import *
	mc = Minecraft()
	mc.postToChat("Placing lights...")
	playerPos = mc.player.getPos()

	s = 10
	space = 4
	x0 = playerPos.x - (s*space/2)
	y0 = playerPos.y - (s*space/2)
	z0 = playerPos.z - (s*space/2)
	for x in range(s):
		for y in range(s):
			for z in range(s):
				h = mc.getBlock(x*space+x0, y*space+y0, z*space + z0)
				if (h != block.AIR.id):
					mc.setBlock(x*space+x0, y*space+y0, z*space + z0, block.GLOWSTONE_BLOCK)
