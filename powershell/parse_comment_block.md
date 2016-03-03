# parse a comment block

If you have a comment block containing text like this:

    .SYNOPSIS
    This script does magical terrible things
    .DESCRIPTION
    In order to do the magical terrible things you must first purchase a license
    .EXAMPLE
    .\dothing.ps1 "TERROR!"

You can parse it into TAGS (e.g. "SYNOPSIS") and bodies (e.g. "This script does magical terrible things")

... using this function:


    function parseComment ($comment) {
      $token = $null
      $body = $null
      $comment.split("`r`n") | % {
        if ($_.StartsWith(".")) 
        {
           #new token, so yield the previous one
           if ($token -ne $null) {
            New-Object psobject -property  @{token = $token.trim(); body = $body.trim()}
           }
          $token = $_.Trim(".");
          $body = ""
        } else {
          $body+= $_ + "`r`n"
        }
      }
      
      #yield any remaining token
      if ($token -ne $null) {
        New-Object psobject -property  @{token = $token.trim(); body = $body.trim()}
      }
    }

For example: 

    parseComment($example) | format-table -property token, body -auto