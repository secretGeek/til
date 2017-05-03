# Find all the TODO's in a file or folder

	function todo()
	{
		# recursively search for TODO followed by colon, or [ ] with an underscore in between.
		findtext ("TODO" + ":|\[_\]")
	}

...which relies on my ever-evoling sense of 'findtext'

Currently something like....

	function findtext($pattern)
	{
	    if ($pattern -eq $null) {
	        write-host "Please provide a pattern you wish to find. (all text files will be searched)" -foregroundcolor  "red"
	        return
	    }
	    #TODO: ability to override included file types, override recurse
	
	    [string[]] $fileTypes = "*.md","*.fmw","*.txt","*.cs","*.cshtml","*.css","*.ps1","*.js","*.bat","*.vbs","*.vb","*.xml","*.config","*.htm","*.html","*.pre","*.ini","*.sql","*.linq","*.json","*.spark","*.ts","*.psm1","*.psd1","*.aspx","*.ascx","*.asp","*.asmx","*.pubxml","*.dgml","*.sln","*.*proj","*.spark"
	
	    #Consider: asa asax ascx ashx asmx asp aspq aspx cfg cfm class config cs cshtm cshtml css csv dbml htaccess htm html ini inc install js log master module mxml php phps pl py readme restext resx script settings sitemap skin sql svc text txt vb vbhtm vbhtml vbs xaml xml xoml xsd xsl xslt
	    
	    $path = get-location
	
	    $ErrorActionPreference = "SilentlyContinue"
	    #TODO: improve the way the error handling is performed, so we ONLY jump to the trap if the regex was invalid
	    get-childitem -Path * -Include $fileTypes -Exclude .hg,*jquery*,modernizr* -Recurse | 
	        ? { $_.DirectoryName -notmatch "_book" } |
	        select-string -pattern $pattern |
	        format-table -property @{Expression={$_.Path.SubString($path.Path.Length+1)};Label="Location"}, 
	            @{Expression={$_.LineNumber};Label="Line"},
	            @{Expression={$_.Line};Label="Match"} -auto
	
	    return
	
	    trap {
	        write-host "Not a valid regex, so falling back to a simple match" -foregroundcolor  "green"
	
	        get-childitem -Path * -Include $fileTypes -Exclude .hg,*jquery*,modernizr* -Recurse | 
	            ? { $_.DirectoryName -notmatch "_book" } |
	            select-string -pattern $pattern -SimpleMatch |
	            ft -property @{Expression={$_.Path.SubString($path.Path.Length+1)};Label="Location"}, 
	                @{Expression={$_.LineNumber};Label="Line"},
	                @{Expression={$_.Line};Label="Match"} -auto
	    }
	}
	
	#set-alias ft FindText -- can't use this: it's format-table already
