# Top 10 files by size, in all subfolders


    gci . -r | sort Length -d | select -f 10 | ft FullName, Length

^^ This relies on a trick: directories have no length. And it abbreviates things somewhat.

A longer version....

    gci -re -in * |
      ?{ -not $_.PSIsContainer } |
      sort Length -descending |
      select -first 10

As a one liner

    gci -re -in * | ?{ -not $_.PSIsContainer } | sort Length -descending | select -first 10

or if you want to exclude contents of `.hg` folder (as we do sometimes...)

    dir -rec -in * | ?{ -not $_.PSIsContainer -and $_.DirectoryName -notmatch ".hg" } | sort Length -descending | select -first 10 | % { $_.FullName + ", " + $_.Length }


## Source

 * <http://stackoverflow.com/questions/798040/find-the-10-largest-files-within-a-directory-structure>