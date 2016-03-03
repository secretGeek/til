# SSRS reports are blank in Google Chrome

Applies to: `SSRS 2008 r2` and `SSRS 2012` on Google Chrome

Find `ReportingServices.css` on the server, it may be here for example:

    C:\Program Files\Microsoft SQL Server\MSRS10_50.MSSQLSERVER\Reporting Services\ReportManager\Styles\ReportingServices.css

Append this line:

    div#ctl31_ctl09,div#ctl31_ctl10{ overflow: visible !important;}

The exact div id's may change over time, because The Struggle Is Real.


## Source

 * http://stackoverflow.com/questions/5428017/cannot-view-ssrs-2008-r2-ssrs-2012-reports-in-safari-chrome-but-works-fine-in

