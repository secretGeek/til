# How to count mercurial repositories (or git repositories)


This recursive function will find all the repositories in a given location, and output their names/locations.


	function SearchForRepos($fullPath) {
		$isRepo = (gci $fullpath ".hg" | measure-object | % { $_.Count })
		
		if ($isRepo -eq 1) {
			$fullPath
		} else {
			get-childitem $fullPath 	| ?{ $_.PSIsContainer } | 
			% { SearchForRepos $_.FullName }
		}
	}	
		
	SearchForRepos "X:\Repositories\" | ? { $_ -notlike '*\Legacy\*' } | out-file "C:\wip\Repositories.csv" 

