# Convert date from UK format to ISO 8601

aka -- Convert date from Australian format to ISO 8601



If '$1' is an australian or UK date such as:

	4/09/2014 8:00
	11/10/2015 1:00
	27/11/2015 14:00

And you want it as an ISO-8601 date such as:

	2014-09-04
	2015-10-11
	2015-11-27

Try this on....	

	<% $1.split('/')[2].split(' ')[0] %>-<% ('000' + $1.split('/')[1]).right(2) %>-<% ('00' + $1.split('/')[0]).right(2) %>
