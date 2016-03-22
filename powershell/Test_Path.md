# Test-Path is how you check if a file exists

    > Test-Path Test_Path.md
    true

Easy, right.

    > Test-Path .\Test_Path.md
    true


Let's check for two files....


    > Test-Path .\Test_Path.md -and Test-Path .\histogram.md
    Test-Path : A parameter cannot be found that matches parameter name 'and'.


No, that's not right, here's how you test for two paths:


    > (Test-Path .\Test_Path.md) -and (Test-Path .\histogram.md)
    true


And how do we test for the existence of a folder/directory, with the "PathType" Container...


    > test-path readme.md -PathType Container
    false

    > test-path MyFiles -PathType Container
    true



