# Closed, Off topic questions with specific tags


    Select 
    distinct 
    p.Id 
    from Posts p
    inner join PostHistory ph on ph.PostId = p.Id
    inner join PostHistoryTypes pht on ph.PostHistoryTypeId = pht.Id
    inner join PostTags pt on p.ID = pt.PostId
    inner join Tags t on pt.TagId = t.Id
    and (t.TagName like 'c#' 
      or t.TagName like 'asp.net%' 
      or t.tagName like 'powershell' 
      or t.TagName like 'sql-server%'
      or t.TagName like 'excel%'
      or t.TagName like 'csv%')
    where 
    p.ClosedDate is not null
    and pht.Name = 'Post Closed' 
    and ph.Comment = '102' -- Off topic
    and p.CreationDate > '01 Jan 2016'
    order by p.id desc