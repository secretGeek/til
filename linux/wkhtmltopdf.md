# wkhtmltopdf on ubuntu headless


Install `wkhtmltopdf` with 

    sudo apt-get install wkhtmltopdf
    
Then try to run it, as per the example at <http://wkhtmltopdf.org>


    wkhtmltopdf http://google.com google.pdf
    
Receive this error:

    QXcbConnection: Could not connect to display
    Aborted (core dumped)
    
    
Solution, according to <http://unix.stackexchange.com/questions/192642/wkhtmltopdf-qxcbconnection-could-not-connect-to-display>    
    
> There is a more easy way to make John WH Smith solution.
>
> Just install xvfb from apt and then, you can run:

    xvfb-run wkhtmltopdf
    
(just put xvfb-run before any wkhtmltopdf command.)    

Okay so I ran:

    sudo apt-get install xvfb


Then the command worked:

    