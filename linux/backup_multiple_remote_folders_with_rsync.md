# backup multiple remote folders with rsync

Yes you can [Backup remote folders with rsync](backup_remote_folders_with_rsync.md) (and ssh) but when backing up multiple folders you don't want to enter your ssh password multiple times.

So how can you write a `.sh` script that will backup multiple folders?

The best way is to write a script that establishes a connection and reuses the connection!


"Create an rsync connection and keep it open"

for example:

	ssh -Nf remote
	rsync -avz out/bin/$BINFILES remote:/usr/bin
	rsync -avz out/lib/$LIBFILES remote:/usr/lib
	rsync -avz out/etc/$ETCFILES remote:/etc
	ssh -O exit remote

Here was my version:

	ssh -Nf myuser@55.55.55.55
	rsync -chavzP --stats myuser@55.55.55.55:/home/myuser/hello/obj/ /home/myuser/test_rsync2/home/myuser/hello/obj/
	rsync -chavzP --stats myuser@55.55.55.55:/home/myuser/test2/ /home/myuser/test_rsync2/home/myuser/test2
	ssh -O exit myuser@55.55.55.55

...didn't work because of these two tricks...

1. First I needed to create an `~/.ssh/config file`

the file contains this:

	ControlMaster auto
	ControlPath ~/.ssh/control:%h:%p:%r

(At this point it still didn't work, the error message was:

	Bad owner or permissions on /home/myuser/.ssh/config
	Bad owner or permissions on /home/myuser/.ssh/config
	rsync: connection unexpectedly closed (0 bytes received so far) [Receiver]
	rsync error: unexplained error (code 255) at io.c(226) [Receiver=3.1.0]
	Bad owner or permissions on /home/myuser/.ssh/config
	rsync: connection unexpectedly closed (0 bytes received so far) [Receiver]
	rsync error: unexplained error (code 255) at io.c(226) [Receiver=3.1.0]
	Bad owner or permissions on /home/myuser/.ssh/config
)

The "Bad owner or permissions" was literally true, hence step 2:

2. I Ran this command:

	chmod 600 ~/.ssh/config

now it worked!

I run the file, it prompts me for the password exactly once, and runs all my many rsyncs.

I remind myself to perform this regularly using devoir.

That's sufficient for now.

## See also

* [Backup remote folders with rsync](backup_remote_folders_with_rsync.md)