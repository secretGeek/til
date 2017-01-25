# handshake failure on hg clone ...bitbucket...


This error:

    abort: error: _ssl.c:504: error:14094410:SSL routines:SSL3_READ_BYTES:sslv3 alert handshake failure


    
    
Time to upgrade mercurial.


From stackoverflow:

> If you are using Mercurial 2.7 or 2.7.1 (time to upgrade!), you can experience this issue. It's a bug causing Mercurial to only try SSLv3, instead of other options. If the server doesn't have SSLv3 (perhaps Bitbucket doesn't have this), the push will fail.    


How to upgrade mercurial? Visit: <https://www.mercurial-scm.org/wiki/Download>. (I'm upgrading TortoiseHg and hope to get hg via that)     -- 64 bit .
Note if you're not an admin you can allegedly use the InnoSetup-based installer to install mercurial (lacks TortoiseHg... 10 MB instead of 26 MB).


    
## Source

 * [Handshake failure when trying to push repository to bitbucket](http://stackoverflow.com/questions/26952911/handshake-failure-when-trying-to-push-repository-to-bitbucket)