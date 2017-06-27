# Python in minecraft

One of my daughters is getting into minecraft. I've heard you can do python in minecraft, so I want to give that a go.



1. Get minecraft

costs $26.95

2. Minecraft no longer requires java. So you don't need to update that.

> You still technically need Java, but it is now downloaded by the Minecraft launcher and stored with the launcher instead of installed across the entire system. If Minecraft is the only reason you have Java installed, you now have no reason to open up your system to Java vulnerabilities. The Java executable used by Minecraft stays with Minecraft and is as good as invisible and inaccessible to the rest of the system. 


3. Run minecraft launcher.

* "Launch Options"
  * "Add new"
    * Name: (e.g.) Test of 1.9
    * Version:  release 1.9  

On the front screen, on the big green button hit the 'up' arrow to change profile. Select this new profile. And press play.    
    
Make sure it works.
Maybe create a new world, superflat, bonus chest on, cheats on.

    
4. Install Forge.

Default options -- i.e. Client.

It downloads and unpacks a bunch of stuff.

![forge_install_success.png](forge_install_success.png)


5. Install raspberry jam mod


https://github.com/arpruss/raspberryjammod/releases

RaspberryJamMod-Installer.exe

(22.8MB)

Installing that you need to choose Python 2.7 or 3.x ....

I went with 3.x which I may regret later.

I'm socially progressive and tend to get myself into this kind of problem for fun.


6. Mods folder

Allegedly the next step is to create a mods folder under:

    $env:appdata\.minecraft

I found there was already a mods folder there. With all this content:


       mods
       +---1.10
       +---1.10.2
       +---1.11
       +---1.11.2
       +---1.12
       +---1.8
       +---1.8.8
       +---1.8.9
       +---1.9
       +---1.9.4        
        

7. Run minecraft launcher...

pick the 'forge' profile by clicking the up arrow on the green button.


8. 

Run a python script by:

/py {scriptname}


e.g.

/py helloworld.py


Here's a helloworld script...

    from mine import *
    mc = Minecraft()
    mc.postToChat("Hello world!")


Next example:

Place a block

    from mine import *
    mc = Minecraft()
    mc.postToChat("Placing a block...")
    playerPos = mc.player.getPos()
    mc.setBlock(playerPos.x,playerPos.y-1,playerPos.z,block.DIAMOND_ORE)


Place a row of blocks




Place a rectangle of blocks


Make a pyramid





## Sources

 * [Minecraft Doesn't Need Java Installed Anymore](https://www.howtogeek.com/210907/minecraft-doesnt-need-java-installed-anymore-its-time-to-remove-it/)
 * [Instructables: Python Coding for Minecraft by arpruss](http://www.instructables.com/id/Python-coding-for-Minecraft/)