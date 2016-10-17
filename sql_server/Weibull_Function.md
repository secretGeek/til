# Weibull function

This is a handy function for modeling statistical likelihood of failure (or survival).

There are four parameters:

    WEIBULL(x,alpha,beta,Cumulative) gives a number between 0 and 1.
    
    X is the value at which to evaluate the function.
    Alpha is a parameter to the distribution.
    Beta is a parameter to the distribution.
    Cumulative (true or false) determines the form of the function.

Here is Weibull function for the cumulative and non-cumulative case.

    WEIBULL(x,a,b,TRUE) = 1 - e^(-(x/b)^a)
    WEIBULL(x,a,b,FALSE) = (a/b^a)(x^(a-1))(e^(-x/b)^a) 
    
In Excel, there is a function WEIBULL, which you can use directly.

If you need to re-implement it in SQL Server, here it is for the cumulative case...

    ALTER function dbo.WeibullCumulative(@x float, @alpha float, @beta float)
    returns float
    as 
    BEGIN
     return 1 - exp(-1 * POWER((@x / @beta), @alpha))
    END
    
And I haven't bothered with the non-cumulative, but it is similar, I think...

    (@alpha/Power(@beta,@alpha))* Power(@x, @alpha-1) * exp(POWER((-1 * @x / @beta), @alpha))

Though I haven't tested it. So be careful with that and tell me if you do implement it.
    
    
## Source

 * <http://www.sqlservercentral.com/Forums/Topic796251-145-1.aspx> (but note the respondent has gotten a and b mixed up)
 * <https://msdn.microsoft.com/en-us/library/cc723032.aspx?f=255&MSPPError=-2147217396> some deprecated msdn article
 