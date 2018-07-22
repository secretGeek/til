# mercurial.ini -- home of mercurial's config.

(or on non-windows machines, your `.hgrc` file.)

Your `mercurial.ini` file is located here:

    %userprofile%\mercurial.ini
    
(If you don't have a file at `%userprofile%\mercurial.ini` then create one now)

In powershell, you would edit:

    $env:userprofile\mercurial.ini

	
(In recent versions of mercurial) You can edit it with this command:

	hg config --edit

To edit the config of a single repo, look for the `.hg\hgrc` file.


When running powershell as an admin you may not have a `$env:userprofile` at all. If you're intending to run mercurial as a non-admin this is not an issue. Just restart powershell as a mortal user.