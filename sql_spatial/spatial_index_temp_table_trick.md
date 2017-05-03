# The SQL Server Spatial Spatial Index Temp Table Trick

*or, What Al Capone Taught Me About Spatial Indexes*

Al Capone is often quoted (more likely misquoted) as having said something along the lines of:

> "You can get more with a kind word and a gun than you can with a kind word alone."

I rarely assault people, but I've dusted up a few databases in my time, and when it comes to charm mixed with brutality, my favorite one-two is the spatial index combined with a temp table:

>You can get more with a spatial index and a temp table than you can with a spatial index alone.

Here's the problem: spatial indexes and regular indexes seem to live in two different worlds. Once a regular index has been consulted, a spatial index can't be used.

The solution I often use is to select the most specific data I can, without using any spatial operations -- into a temporary table. And then build a spatial index on that temporary table. And then perform whatever spatial search I need.


I learnt this technique from the spatial master, John O'Brien, and he may have learnt it from [Rob Farley](http://sqlblog.com/blogs/rob_farley/)


Note that you have to select into a # temp table, not just use a table variable. Table variables are wonderful things, but you can't create any index on a table variable (spatial or regular). (See [this comparison of table variables and #temp tables](http://stackoverflow.com/a/13777841/49))



## How can I tell if my spatial index is being used?

You can't fix a problem you don't know you have.

The first clue you have that a spatial index is not being used is that: (a) you are performing a spatial operation in a predicate, and (b) performance is woeful.

You may find out that your spatial index isn't being used -- but how do you know up front?

I guess you could use look at the query execution plan on every query you run, but this is often too much information. The simplest trick for a spatial index is to provide a spatial index hint. That way, if the index isn't being used, you'll be presented with a message informing you. Then you know you have a problem.

And on more than a few lucky occasions, a hint makes up for SQL Server over-estimating the cost of a spatial index, and causes dramatic improvements in performance.




## Why isn't it using the spatial index??

[Bob Beauchemin, June 21, 2012](http://www.sqlskills.com/blogs/bobb/does-everybody-get-that-spatial-index-reprise/) says:

> The optimizer is superb at "reasoning" over most relational queries and indexes, but tends to underestimate the spatial index, which can have a dramatic effect.


First, get the smallest number of rows you can, *without* using any spatial terms, in their own table (even if it is a temporary table).

 
    CREATE TABLE #SurveyLotPlan
    (
        Id int IDENTITY PRIMARY KEY,
        Survey_Lotplan nvarchar(32),
        Survey_GEO geography
    )
 
 
    Insert into
        #SurveyLotPlan
    Select
        Lot_plan as Survey_Lotplan,
        GEO as Survey_GEO
    SurveyDB.dbo.AllSurveys

 
 

Then create a spatial index on that table. (Which has a primary key, thus has a clustered index already) These parameters (`high`, `high`, etc) could perhaps be improved through actual research rather than the anecdotal approach I've accepted thus far.
 


    CREATE SPATIAL INDEX ix_surveylotplan ON #SurveyLotPlan (Survey_GEO) WITH (GRIDS = (HIGH, HIGH, HIGH, HIGH));
 


When running the actual spatial query you may try it without the spatial index hint... but if you do want to use the hint, here is an example. Also if the hint is not used by the query, you will get a message to that effect.
 
 

    Update SL
    Set Survey_Lotplan = s.survey_lotplan,
    survey_geo = s.survey_geo
    from #SurveyLotPlan SL
    OUTER APPLY (SELECT TOP 1
                survey_lotplan, survey_geo
            from
                #SurveyLotPlan survey WITH (INDEX(ix_surveylotplan))
            where
                survey.Survey_GEO.STIntersects(Sl.PointGeo) = 1 
          ) s
     
    -- ^^ 4 seconds
