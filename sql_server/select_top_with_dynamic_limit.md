# Select top N where N is a variable

A lot of kids don't know this so it's worth writing down.

Let's imagine you start with a query that shows the top 50, such as:

    Select TOP 50 * from Leaderboard order by Score desc

Later, you want to make '50' a variable, so you try:

    DECLARE @limit int = 50
    Select TOP @limit * from Leaderboard order by Score desc

And you're met with an error, to wit:

    Msg 102, Level 15, State 1, Line 2
    Incorrect syntax near '@limit'.

So you give up, and decide it's impossible.

What you don't realise is just how close to victory you were!

Put parentheses around the @limit and you're done!

    DECLARE @limit int = 50
    Select TOP(@limit) * from Leaderboard order by Score desc

Presto!

(In other news, Access DB won't let you use '`Select top 0 * from TableName`' ...pesky Access)