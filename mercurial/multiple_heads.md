# multiple heads when trying to update or trying to fetch.

    hg fetch
    abort: multiple heads in this branch (use "hg heads ." and "hg merge" to merge)
    
Running `hg heads` (without the dot) returns a *lot* of heads.

With the dot there are 3 heads...

    hg heads .
    
    changeset:   3818:7a511cd2c9fe
    tag:         tip
    parent:      3816:e9b8cdddef15
    user:        User2
    date:        Yesterday
    summary:     Note about this commit

    changeset:   3817:2bedb24b7f36
    user:        UserMe
    date:        Today
    summary:     Note about that commit

    changeset:   3403:358f6ec2a17e
    parent:      3402:c6ca1879d9ff
    parent:      3401:134c61c711d9
    user:        UserMe
    date:        13 months ago on a day when I was about to go on holidays
    summary:     merge in some other thing

So the problem  is that one dated "13 months ago on a day when I was about to go on holidays".

Hmmm. Looking at what it does, it included code that is merged in elsewhere anyway.

Infact -- 3403 and its troublesome parent 3402 are "secret". So these are secret commits. How can I at least close them out?


    hg merge
    abort: branch 'default' has 3 heads - please merge with an explicit rev
    (run 'hg heads .' to see heads)

    hg merge 3816
    abort: merging with a working directory ancestor has no effect

    
Go back to the old troublesome branch, and close it...

    hg update -r 3403
    hg commit --close-branch -m 'Closing old branch'

Then come back to the default/tip

    hg update -C default

Now merge the work that hasn't been merged

    hg merge 3817

And commit it...

    hg commit -Am "merge that sucker."

For bonus points: rebase.

