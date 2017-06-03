# To convert OFX to CSV using NimbleText

Open the OFX file in an editor such as NotePad++

Copy all the text from the first occurrence of:

    <STMTTRN>

to the last occurrence of:
	
    </STMTTRN>

...then paste the result into the first textarea in [NimbleText](http://NimbleText) (desktop version).

Paste in this pattern:

    $once
    $1,$5,$7,$9,$11
    $each
    $2,$6,$8,$10,"$12"

    
Use a 'Regex Col Delim' (Tools | Options | "Column Delimiter is regular expression")

Use this column separator: [&lt;&gt;]

(That's a pair of angle brackets inside a pair of square brackets)

Row separator = &lt;/STMTTRN&gt;

And you're good to go.

The result can be saved as a .csv file.

Alternatively, just can just paste the result directly into Excel, and if you use the "Text to columns" button on the "Data" tab of the ribbon, you can split the values.


Here's an example of the result:
    

    TRNTYPE,DTUSER,TRNAMT,FITID,MEMO
    CREDIT,20170327,273.00,A328243244663_000002,"Direct Credit 301720 Davidson Hitman 2318"
    CREDIT,20170327,500.00,F708625054901001NPA,"Direct Credit 128594 Budget Extortion"
    DEBIT,20170324,-396.00,N708416556793001NPB,"Chq 000144 presented"
    CREDIT,20170322,250.00,D032274202095,"Transfer from SwissBank Drug Cartel 12"

Now --- if you want the DATE  (`DTUSER`) to be formatted neatly, you can enhancify the pattern, instead of just `$6` -- slice the string up, like this:

    $once
    $1,$5,$7,$9,$11
    $each
    $2,<% $6.slice(6,8) %>/<% $6.slice(4,6) %>/<% $6.slice(0,4) %>,$8,$10,"$12"

Result would then be    
    
    TRNTYPE,DTUSER,TRNAMT,FITID,MEMO
    CREDIT,27/03/2017,273.00,A328243244663_000002,"Direct Credit 301720 Davidson Hitman 2318"
    CREDIT,27/03/2017,500.00,F708625054901001NPA,"Direct Credit 128594 Budget Extortion"
    DEBIT,24/03/2017,-396.00,N708416556793001NPB,"Chq 000144 presented"
    CREDIT,22/03/2017,250.00,D032274202095,"Transfer from SwissBank Drug Cartel 12"




## Backstory

I needed this pattern because the Commonwealth bank's option to export as CSV only included 4 columns, and no transaction number! Who leaves out a primary key... honestly. 

Exporting as OFX included all the details, but it wasn't in a format where it was ready for Excel to look at it. 

So the bridge, the glue, the duct tape, as always, was [NimbleText](http://NimbleText). There were some tools you could buy that were tailored specifically to OFX -> CSV conversions. But I like my general purpose tool much better.


## References

 * [NimbleText](http://NimbleText) 
 