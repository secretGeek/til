# Find all the TODO's in a file or folder

	function todo()
	{
		# recursively search for TODO followed by colon, or [ ] with an underscore in between.
		findtext ("TODO" + ":|\[_\]")
	}

...which relies on my ever-evolving sense of 'findtext'

Currently something like.... (this is dynamically loaded from util)

	[string[]] $fileTypes = "*.md","*.fmw","*.txt","*.cs","*.cshtml","*.css","*.ps1","*.js","*.bat","*.vbs","*.vb","*.xml","*.config","*.htm","*.html","*.pre","*.ini","*.sql","*.linq","*.json","*.spark","*.ts","*.psm1","*.psd1","*.aspx","*.ascx","*.asp","*.asmx","*.pubxml","*.dgml","*.sln","*.*proj","*.spark","*.rdl","*.py","*.log","*.las","*.ascx", "*.inc", "*.xaml","*.sh","*.csv","*.tsv","*.php"
	
	#Consider: asa asax ascx ashx asmx asp aspq aspx cfg cfm class config cs cshtm cshtml css csv dbml htaccess htm html ini inc install js log master module mxml php phps pl py readme restext resx script settings sitemap skin sql svc text txt vb vbhtm vbhtml vbs xaml xml xoml xsd xsl xslt
	#function findtext_norecurse($pattern)
	#function findtext_raw($pattern)
	#function findtext_raw_casesensitive($pattern)
	#function findtext_type($types, $pattern, $recursive){
	
	function findtext($pattern, $recursive)
	{
	    if ($pattern -eq $null) {
	        write-host "Please provide a pattern you wish to find. (all text files will be searched)" -foregroundcolor  "red"
	        return
	    }
	    
	    if ($recursive -eq $null) {
	        #"SETTING RECURSIVE"
	        $recursive = $true
	    } else {
	        #"recursive was not null it was $recursive"
	    }
	
	    # $path = get-location
	    $path = (get-location | % { $_.ProviderPath })
	
	    $ErrorActionPreference = "SilentlyContinue"
	
	    get-childitem -Path * -Include $fileTypes -Exclude .hg,*jquery*,modernizr* -Recurse:$recursive |
	        ? { $_.DirectoryName -notmatch "_book" } |
	        select-string -pattern $pattern |
	        format-table -property @{Expression={$_.Path.SubString($path.Length+1)};Label="Location"},
	            @{Expression={$_.LineNumber};Label="Line"},
	            @{Expression={$_.Line};Label="Match"} -auto
	
	    return
	
	    trap {
	        write-host "Not a valid regex, so falling back to a simple match" -foregroundcolor  "green"
	
	        get-childitem -Path * -Include $fileTypes -Exclude .hg,*jquery*,modernizr* -Recurse |
	            ? { $_.DirectoryName -notmatch "_book" } |
	            select-string -pattern $pattern -SimpleMatch |
	            ft -property @{Expression={$_.Path.SubString($path.Length+1)};Label="Location"},
	                @{Expression={$_.LineNumber};Label="Line"},
	                @{Expression={$_.Line};Label="Match"} -auto
	    }
	}
	
	# same as findtext but does not use recursive
	function findtext_norecurse($pattern)
	{
	    findtext $pattern $false
	}
	
	# Pattern is not treated as regular expression -- it's a "simplematch" instead
	function findtext_raw($pattern)
	{
	    if ($pattern -eq $null) {
	        write-host "Please provide a pattern you wish to find. (all text files will be searched)" -foregroundcolor  "red"
	        return
	    }
	
	    $path = (get-location | % { $_.ProviderPath })
	    
	    get-childitem -Path * -Include $fileTypes -Exclude .hg,*jquery*,modernizr* -Recurse |
	        ? { $_.DirectoryName -notmatch "_book" } |
	        select-string -pattern $pattern -SimpleMatch |
	        ft -property @{Expression={$_.Path.SubString($path.Length+1)};Label="Location"},
	            @{Expression={$_.LineNumber};Label="Line"},
	            @{Expression={$_.Line};Label="Match"} -auto
	
	}
	
	function findtext_raw_casesensitive($pattern)
	{
	    if ($pattern -eq $null) {
	        write-host "Please provide a pattern you wish to find. (all text files will be searched)" -foregroundcolor  "red"
	        return
	    }
	
	    $path = (get-location | % { $_.ProviderPath })
	    
	    get-childitem -Path * -Include $fileTypes -Exclude .hg,*jquery*,modernizr* -Recurse |
	        ? { $_.DirectoryName -notmatch "_book" } |
	        select-string -pattern $pattern -SimpleMatch -CaseSensitive |
	        ft -property @{Expression={$_.Path.SubString($path.Length+1)};Label="Location"},
	            @{Expression={$_.LineNumber};Label="Line"},
	            @{Expression={$_.Line};Label="Match"} -auto
	}
	
	function findtext_type($types, $pattern, $recursive){
	
		$originalTypes = $fileTypes;
		$fileTypes = $types;
		findtext $pattern $recursive;
		$fileTypes = $originalTypes;
	}
	
	
	set-alias fi FindText # can't use "ft", it's "format-table" already
