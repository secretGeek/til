# DataTables alert

If suddenly your jQuery.DataTable issues an alert like this (this is version 1.9.4):

    DataTables warning (table id = 'DataTables_Table_0'): Cannot reinitialise DataTable.To retrieve the DataTables object for this table, pass no arguments or see the docs for bRetrieve and bDestroy

You can't stop it from being able to pop alerts, until you edit the source...

Change:

    if ( DataTable.ext.sErrMode == 'alert' )
    {
        alert(sAlert);
    }

To:

    if ( DataTable.ext.sErrMode == 'alert' )
    {
        console.log(sAlert);
    }

(Originally I tried `console.error` but I don't think it's supported on IE version=old)


    
And in the minified version of DataTables, `jquery.dataTables.min.js` you need to...

Change:

    if("alert"==j.ext.sErrMode)alert(a);else throw Error(a)    
    
To:

    if("alert"==j.ext.sErrMode)console.log(a);else throw Error(a)

## Source

 * [Correctly Suppressing Warnings in DataTables?](http://stackoverflow.com/questions/11941876/correctly-suppressing-warnings-in-datatables)
