# Aliases in git

This is one of my favorite things about git, the alias system. I could play with this all day.

Aliases from my `~\.gitconfig` file:

	[alias]
		# mercurial compatability, more see https://github.com/sympy/sympy/wiki/Git-hg-rosetta-stone#Rosetta_Stone
		outgoing = log --branches --not --remotes=origin
		out = !git outgoing
		incoming = !git fetch ; git log ..origin/master
		in = !"git incoming"
		st = status
		stat = status
		outy = !"git l4 --branches --not --remotes=origin"
		paths = remote -v
		path = !"git paths"
		heads = show-ref
		#lg = !git log --all --decorate --oneline --graph
		l1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
		l2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
		l3 = log --graph --abbrev-commit --decorate --format=format:'%C(magenta)%h%C(reset) - %C(bold cyan)%ad%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cd)%C(reset) %C(auto)%d%C(reset)%n''        %C(white)%s%C(reset)%n''        %C(cyan) %an %C(reset)' --date=short
		l4 = log --graph --pretty=format:'%C(magenta)%h%Creset %C(blue)%ad%Creset %C(bold cyan)%an%Creset %s%C(yellow)%d%Creset' --date=short
		l5 = log --graph --pretty=format:'%C(magenta)%h%Creset %C(blue)%ad%Creset %C(bold cyan)%an%Creset %s%C(yellow)%d%Creset' --date=short --full-history --all
		l6 = log --graph --decorate --pretty=oneline --abbrev-commit #LOL
		lg = !"git l4" # points at my current favorite out of those
	
		cheat = !cat 'C:/users/leonb/Dropbox/secretGeek/util/powershell/scriptlets/git_cheat.txt'
	
		# Phil Haack's aliases, see http://haacked.com/archive/2014/07/28/github-flow-aliases/
		co = checkout
		ec = config --global -e
		up = !git pull --rebase --prune $@ && git submodule update --init --recursive
		cob = checkout -b
		cm = !git add -A && git commit -m
		save = !git add -A && git commit -m 'SAVEPOINT'
		wip = !git add -u && git commit -m 'WIP'
		undo = reset HEAD~1 --mixed
		amend = commit -a --amend
		wipe = !git add -A && git commit -qm 'WIPE SAVEPOINT' && git reset HEAD~1 --hard
		bclean = "!f() { git branch --merged ${1-master} | grep -v " ${1-master}$" | xargs -r git branch -d; }; f"
		bdone = "!f() { git checkout ${1-master} && git up && git bclean ${1-master}; }; f"
		#alias = !git config --get-regexp ^alias\\. | sed -e s/^alias\\.// -e s/\\ /\\ =\\ /
		alias = config --get-regexp alias
		#ooutgoing = log --branches --not --remotes=origin
		#oout = ooutgoing


## See also

 * [TheUltimate Git Alias Setup](https://gist.github.com/mwhite/6887990)
