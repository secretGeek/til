# Convert excel spreadsheet to csv on linux (xlsx to csv)


Get gnumeric

    apt-get install gnumeric


Then use ssconvert to do the conversion


    ssconvert oldfile.xlsx newfile.csv

On a headless server (such as a droplet) it may issue a lot of warnings. Pipe output and warning to `null` via:

    ssconvert oldfile.xlsx newfile.csv > /dev/null 2>&1



Well this is a nifty trick!

## Source

 * [Convert xlsx to csv in linux command line](http://stackoverflow.com/questions/10557360/convert-xlsx-to-csv-in-linux-command-line)