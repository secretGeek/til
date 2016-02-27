# Histogram

You can use the group-object to do standard grouping.

This shows all of the files in the current folder, grouped into buckets according to their size. 
Each bucket is 1000 bytes.

    dir |
        group-object -property { [int]($_.length / 1000) } | sort @{e={$_.Name -as [int]}} |
            format-table @{Expression={[string]([int]($_.Name) * 1000) + "-" + [string](-1+([int]($_.Name)+1) * 1000)};Label="Bucket";width=10},
                @{Expression={$_.Count};Label="Count";width=10},
                @{Expression={$_.Group};Label="Members";width=50} -autosize
