# To convert OFX to CSV using NimbleText

Open the OFX file in an editor such as NotePad++

Copy all the text from the first occurrence of:

    <STMTTRN>

to the last occurrence of:
	
    </STMTTRN>

...then paste the result into the first textarea in [NimbleText](http://NimbleText) (desktop version).

Paste in this pattern:

	$once

	$3,$5,$7,$9,$11,$13

	$each

	$4,$6,$8,$10,$12,"$14"



Use a 'Regex Col Delim' (Tools | Options | "Column Delimiter is regular expression")

Use this column separator: [&lt;&gt;]

(That's a pair of angle brackets inside a pair of square brackets)

Row separator = &lt;/STMTTRN&gt;

And you're good to go.

The result can be saved as a .csv file.

Alternatively, just can just paste the result directly into Excel, and if you use the "Text to columns" button on the "Data" tab of the ribbon, you can split the values.

## Backstory

I needed this pattern because the Commonwealth bank's option to export as CSV only included 4 columns, no transaction number etc. Exporting as OFX included all the details, but it wasn't in a format where it was ready for Excel to look at it. So the bridge, the glue, the duct tape, as always, was NimbleText.


## References

 * [NimbleText](http://NimbleText) 