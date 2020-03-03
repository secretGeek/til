# The Internet Archive Download Tool

I don't know where else to write about this... the internet archive has a nifty download tool

Read more here: https://archive.org/services/docs/api/internetarchive/cli.html

	$ chmod +x ia
	$ ./ia help
	A command line interface to archive.org.

	usage:
			ia [--help | --version]
			ia [--config-file FILE] [--log | --debug] [--insecure] <command> [<args>]...

	options:
			-h, --help
			-v, --version
			-c, --config-file FILE  Use FILE as config file.
			-l, --log               Turn on logging [default: False].
			-d, --debug             Turn on verbose logging [default: False].
			-i, --insecure          Use HTTP for all requests instead of HTTPS [default: false]

	commands:
			help      Retrieve help for subcommands.
			configure Configure `ia`.
			metadata  Retrieve and modify metadata for items on archive.org.
			upload    Upload items to archive.org.
			download  Download files from archive.org.
			delete    Delete files from archive.org.
			search    Search archive.org.
			tasks     Retrieve information about your archive.org catalog tasks.
			list      List files in a given item.

	See 'ia help <command>' for more information on a specific command.


Info about [downloading](https://archive.org/services/docs/api/internetarchive/cli.html#download)

But see also this twitter thread from Jason Scott:

https://twitter.com/textfiles/status/1224011624933134336


<blockquote class="twitter-tweet"><p lang="en" dir="ltr">THE BANDWIDTH BUSTER TOOLKIT: The best way to interact with <a href="https://twitter.com/internetarchive?ref_src=twsrc%5Etfw">@internetarchive</a> en masse is the Internet Archive Client, a command-line program that will use our API and allow you to do mass actions and downloads with incredible ease. <a href="https://t.co/puAw9l0sJ6">https://t.co/puAw9l0sJ6</a> <a href="https://t.co/RMDclczWnW">https://t.co/RMDclczWnW</a></p>&mdash; Jason Scott (@textfiles) <a href="https://twitter.com/textfiles/status/1224011624933134336?ref_src=twsrc%5Etfw">February 2, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>






## Source 

* [](https://archive.org/services/docs/api/internetarchive/cli.html)