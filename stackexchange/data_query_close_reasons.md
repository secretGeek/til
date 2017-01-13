# How to (programmatically) find the exact reason for closing a question?

    Select
        p.Id as [Post Link],
        pht.Name,
        ph.*
    from Posts p
    inner join PostHistory ph on ph.PostId = p.Id
    inner join PostHistoryTypes pht on ph.PostHistoryTypeId = pht.Id
    where p.Id = 17335689

We can see that the post was closed with Reason 102 which means 'Off Topic'
But there is no information here about which OffTopic Reasons.

(if you visit the question you'll see that the OffTopic reason was 
 "Questions asking us to recommend or find a tool, library or 
favorite off-site resource are off-topic")


    Select
     p.Id as [Post Link],
     pf.*
    from Posts p
    inner join PendingFlags pf on pf.PostId = p.Id
    where p.Id = 17335689

    --0 rows. No "Pending Flags"
    
I think I've found that 'PendingFlags' only exist for questions that are pending closure, not for closed questions.
It's a shame because this table has the promising 'CloseAsOffTopicReasonTypeId' 
that I am chasing.


    Select
     p.Id as [Post Link],
     c.*
    from Posts p
    inner join Comments c on c.PostId = p.Id
    where p.Id = 17335689

    --0 rows. No comments

    Select 
    p.Id as [Post Link],
     vt.* 
    from Posts p
    inner join Votes v on v.PostId = p.Id
    inner join VoteTypes vt on v.VoteTypeID = vt.Id
    where p.Id = 17335689

    --3 rows. 2 down votes 1 upvote. No clue here about off topic sub reason.

    Select 
    p.Id as [Post Link],
    rtt.*,
    rts.Name,
     rt.* ,
     rtr.*,
     rtrt.*
    -- pf.*
     --rt2.*
    from Posts p
    inner join ReviewTasks rt on rt.PostId = p.Id
    inner join ReviewTaskTypes rtt on rtt.Id = rt.ReviewTaskTypeId
    inner join ReviewTaskStates rts on rt.ReviewTaskStateId = rts.Id
    inner join ReviewTaskResults rtr on rtr.Id = rt.CompletedByReviewTaskId
    inner join ReviewTaskResultTypes rtrt on rtrt.Id = rtr.ReviewTaskResultTypeId
    where p.Id = 17335689

    --1 row. 

This shows details of a review.
There was a review, it was completed, it has a result, 
the result was that the question was closed.
But this doesn't tell us the close reason sub types either!


## Source 

 * <http://meta.stackexchange.com/questions/255880/how-can-we-write-a-query-in-data-stackexchange-to-find-the-closeasofftopicreason>
 
 

