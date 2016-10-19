# Inline MIN

In SQL, MIN is an aggregate, not a function to be used inline.

So here's a function similar to Math.Min from javascript and C#.

For float:

    CREATE function dbo.MinFloat(@val1 float(8), @val2 float(8))
    returns float(8)
    as
    begin
      if @val1 < @val2
        return @val1
      return isnull(@val2, @val1)
    end


For date time:
    
    CREATE function dbo.MinDateTime(@val1 DateTime, @val2 DateTime)
    returns DateTime
    as
    begin
        if @val1 < @val2
            return @val1
        return isnull(@val2, @val1)
    end

etc.
    
Or using SQL Generics you can simply say:

    CREATE function dbo.InlineMin<T>(@val1 T, @val2 T)
    returns T
    as
    begin
        if @val1 < @val2
            return @val1
        return isnull(@val2, @val1)
    end
    
    
You will of course need to write your own compiler to use SQL Generics.

Similarly if you want to use PARAMS, such as:

    CREATE function dbo.InlineMin<T>(PARAMS @val1 Array<T>)

    
But "First-class" array handling is strangely absent from SQL even though it could fit so naturally with set-based processing.
