# Scalar Function in SQL that returns everything After a specified character.

Return the substring after the given character.
e.g. 

    select dbo.AfterChar('Jim@gmail.com','@')
    ...returns 'gmail.com'.
    
    select dbo.AfterChar('Jim#2315','#')
    ...returns '2315'.

Special cases:


    select dbo.AfterChar('Jim#2315','@') 
    ...returns 'Jim#2315', since @ is not in the string.

    
    select dbo.AfterChar(null,'@') 
    ...returns null, since @ cannot be in the string.




    -- Return the substring after the given character.
    -- e.g. 
    --   select dbo.AfterChar('Jim@gmail.com','@') -- returns 'gmail.com'.
    --   select dbo.AfterChar('Jim#2315','#') -- returns '2315'.
    -- Special cases:
    --   select dbo.AfterChar('Jim#2315','@') -- returns 'Jim#2315', since @ is not in the string.
    --   select dbo.AfterChar(null,'@') -- returns null, since @ cannot be in the string.
    Alter FUNCTION [dbo].[AfterChar]
        (
          @value VARCHAR(MAX) ,
          @separator CHAR(1) 
        )
    RETURNS VARCHAR(MAX)
    AS 
    BEGIN
        if (@value is null) return @value
        
        declare @charLocation integer;
        Set  @charLocation = CHARINDEX(@separator, @value)
        if (@charLocation = 0) return @value
        return SubString(@Value, @charLocation+1, Len(@Value))
    END
