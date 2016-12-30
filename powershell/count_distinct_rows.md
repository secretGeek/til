# Count distinct rows (in powershell)

By far my most commonly run query is this:

    Select Column, Count(*)
    from SomeTable
    Group by Column
    order by 2 desc

When I have plain text and I want to perform that same check, I usually use a little tool I wrote called Grouply (or NimbleGroup)

But to do it in plain powershell you use a command like this:     

    cat .\22889_.txt | group | % { ($_.Name + ',' + $_.Count) }

(Assuming 22889_.txt is a file containing the rows you wish to group.)


Note: If all you want to do is **count** the number of lines, use `Measure-Object` (alias `measure`) instead.


e.g. to count all the date entries (Date & Time Long Format) in a file called `journal.md` you can do this

    cat journal.md | ? { $_ -match '^[0-9]+:[0-9]+ (A|P)M [A-Z]+day, [0-9]+ [A-Z]+ [0-9]+' } | measure | % count
