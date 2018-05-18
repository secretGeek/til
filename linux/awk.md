# Getting started with awk.


	$ awk 'BEGIN { print 42 }'
	42
	
	$ awk 'BEGIN { print "Hello World" }'
	Hello World	
	
Okay - a nice start.

Bah, lemme push it a bit....


	$ awk ''
	$ awk 'BEGIN {}'
	$ awk 'BEGIN { print;}'

	$ awk 'BEGIN { print}'

	$ awk 'BEGIN { print "Hello"}'
	Hello
	$ awk 'BEGIN { print "Hello" + 42}'
	42
	$ awk 'BEGIN { print "Hello"42}'
	Hello42
	$ awk 'BEGIN { print "Hello" 42}'
	Hello42
	$ awk 'BEGIN { print "Hello" 42 "Hello"}'
	Hello42Hello
	$ awk 'BEGIN { print; print ;print}'
	
(3 empty lines).


Ok, ready to move on now.

	
In the following examples i'll be working with a file, called `data.txt`, that contains:

	Beth    4.00    0
	Dan     3.75    0
	Kathy   4.00    10
	Mark    5.00    20
	Mary    5.50    22
	Susie   4.25    18

...where there is a `tab` character between each field.


From there, we can pipe the input to `awk`...

	~$ cat data.txt | awk '{print $1}'
	Beth
	Dan
	Kathy
	Mark
	Mary
	Susie	

Or can have `awk` load the file, for example:

	$ awk '{print $1}' data.txt
	Beth
	Dan
	Kathy
	Mark
	Mary
	Susie



	
## References

	* [A Scripter's Notes: awk](https://scripter.co/notes/awk)