# Turtle logo in Python

Err... this was almost too easy.

From powershell I typed:

    python
    
I was then in an interactive python console.    

Then I just typed:

    from turtle import *
    
    
Then I tried:

    fd 100

But received...
    
      File "<stdin>", line 1    
        fd 100                  
             ^                  
    SyntaxError: invalid syntax 

So I tried:

    fd (100)
    
And a graphics window appeared, titled "Python Turtle Graphics" with a "Tk" logo. 

And on that window, a little turtle (represented by an arrow, in the center of the screen) moved forward 100 pixels.

I used the Windows+Arrows keys to resize powershell and "Python Turtle Graphics" so they each took up half the screen. And I was away!


Backing up a little... I could've gone like this:


    import turtle
    
Then to call the `fd` function for example...

    turtle.fd(100)
    
With my C# brain, I guess that `from turtle import *` means, grab all the `public static` methods of the `turtle` class and make them first-class functions that no longer need to be qualified. So 'turtle.fd' can be written as just 'fd'.

