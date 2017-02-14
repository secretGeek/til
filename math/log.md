## Logarithms



	Log_n (n^x) = x   (where the _n denotes "subscript n" and means the Log was in base n)


For example:

	Log_10 (10)	  = 1   (The subscript 10 means the Log was in base 10)
	Log_10 (1000) = 3
	Log_2  (32)   = 5



Similarly:

	Log_e (e) = 1

Log base e is referred to as "the natural log" and written as the function "ln" (pronounced “Lin”)

Where e is [Euler's numbers](eulers_number.md)


Hence

	Log_e (x) = ln(x)   -- much easier to write, no need for subscripts.

By convention, if you write Log(x) without specifying a base, then you assume it to be base 10.


	Log(1) = 0
	Ln(1) = 0

	Because n^0 = 1


## Log is undefined for 0 and negative numbers.	

As a positive number get smaller and smaller and closer to zero the Log of the number becomes a huge negative number

e.g. 10^-10000000   is 0.0000001

So   Log(0.00000001) = -7

What happens when the number reaches 0? We are in spooky 'undefined' territory
	

	ln(0) = undefined

	ln(-3) undefined




	
## Basic log rules(these work for any base)

	Log(m^n) = n Log(m)


	Log(a) + Log(b) = Log(a*b)

e.g. 
	Log(10) + Log(1000) = 1+3 = 4
    Log(10000) = 4
	10000 = 10*1000 

	
	Log(a) - Log(b) = Log(a/b)

e.g. 
	Log(10000) - Log(100) = Log(10000/100) = Log(100) = 2
	

The Log base switch rule


	log_b(c) = 1 / log_c(b)

	
	
## Convert to the natural log.	


Sometimes you'll have an equation that has a base other than 10 or `e`. To be able to get an answer on your calculator you'll need to convert it to base 10 or base `e`.

In such cases you use: the log base change rule

	log_b(x) = log_c(x) / log_c(b)

So perhaps you've ended up with an answer of: `log_12 (14)`

To turn this into a number....

	log_12 (14) = ln(14) / ln(12) 
	
Which you can plug into a calculator (provided it has a `ln` button, i.e. it is a 'scientific' calculator)	


	


