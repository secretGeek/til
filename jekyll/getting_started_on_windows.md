# Jekyll on Windows

Use this guide:
    
    <https://jekyllrb.com/docs/windows/>
    
([Instructions from Dave Burela](https://davidburela.wordpress.com/2015/11/28/easily-install-jekyll-on-windows-with-3-command-prompt-entries-and-chocolatey/))


    Start-Process "$env:ChocolateyInstall\lib\ConsoleZ\tools\console.exe" -Verb runAs
    choco install ruby -y
    
    (close that command window)
    
    Start-Process "$env:ChocolateyInstall\lib\ConsoleZ\tools\console.exe" -Verb runAs
    gem install jekyll
    
    jekyll new myblog
    cd myblog
    jekyll serve
    
    (browse to http://127.0.0.1:4000/ or http://localhost:4000)
    
    
edit _config.yml.    



Since I'm doing this in order to potentially use github-pages to publish more sites... I looked into adding redirects to Jekyll.

That led me here <https://help.github.com/articles/redirects-on-github-pages/> wherein I was instructed to add this to my _config.yml:

    gems:
      - jekyll-redirect-from
    

And then, in a post, add a note about the redirects it accepts...

---
redirect_from: "/foo"
---
    
Which resulted in this error message:

> Dependency Error: Yikes! It looks like you don't have jekyll-redirect-from or one of its dependencies installed. In order to use Jekyll as currently configured, you'll need to install this gem. The full error message from Ruby is: 'cannot load such file -- jekyll-redirect-from' If you run into trouble, you can find helpful resources at http://jekyllrb.com/help/!

At which time I realised I'd better install not just that gem... but all the gems that come in the "github-pages" gem... (i.e. those listed here: <https://pages.github.com/versions/>

    gem install github-pages

    
    
    
Which produced this output:

    Fetching: listen-3.0.6.gem (100%)
    Successfully installed listen-3.0.6
    Fetching: jekyll-sass-converter-1.3.0.gem (100%)
    Successfully installed jekyll-sass-converter-1.3.0
    Fetching: net-dns-0.8.0.gem (100%)
    Successfully installed net-dns-0.8.0
    Fetching: public_suffix-1.5.3.gem (100%)
    Successfully installed public_suffix-1.5.3
    Fetching: ethon-0.9.0.gem (100%)
    Successfully installed ethon-0.9.0
    Fetching: typhoeus-0.8.0.gem (100%)
    Successfully installed typhoeus-0.8.0
    Fetching: addressable-2.4.0.gem (100%)
    Successfully installed addressable-2.4.0
    Fetching: multipart-post-2.0.0.gem (100%)
    Successfully installed multipart-post-2.0.0
    Fetching: faraday-0.9.2.gem (100%)
    Successfully installed faraday-0.9.2
    Fetching: sawyer-0.7.0.gem (100%)
    Successfully installed sawyer-0.7.0
    Fetching: octokit-4.3.0.gem (100%)
    Successfully installed octokit-4.3.0
    Fetching: github-pages-health-check-1.1.0.gem (100%)
    Successfully installed github-pages-health-check-1.1.0
    Fetching: mini_portile2-2.1.0.gem (100%)
    Successfully installed mini_portile2-2.1.0
    Fetching: pkg-config-1.1.7.gem (100%)
    Successfully installed pkg-config-1.1.7
    Fetching: nokogiri-1.6.8-x64-mingw32.gem (100%)
    Nokogiri is built with the packaged libraries: libxml2-2.9.4, libxslt-1.1.29, zlib-1.2.8, libiconv-1.14.
    Successfully installed nokogiri-1.6.8-x64-mingw32
    Fetching: i18n-0.7.0.gem (100%)
    Successfully installed i18n-0.7.0
    Fetching: thread_safe-0.3.5.gem (100%)
    Successfully installed thread_safe-0.3.5
    Fetching: tzinfo-1.2.2.gem (100%)
    Successfully installed tzinfo-1.2.2
    Fetching: activesupport-4.2.7.gem (100%)
    Successfully installed activesupport-4.2.7
    Fetching: html-pipeline-2.4.2.gem (100%)
    -------------------------------------------------
    Thank you for installing html-pipeline!
    You must bundle Filter gem dependencies.
    See html-pipeline README.md for more details.
    https://github.com/jch/html-pipeline#dependencies
    -------------------------------------------------
    Successfully installed html-pipeline-2.4.2
    Fetching: gemoji-2.1.0.gem (100%)
    Successfully installed gemoji-2.1.0
    Fetching: jemoji-0.6.2.gem (100%)
    Successfully installed jemoji-0.6.2
    Fetching: jekyll-mentions-1.1.3.gem (100%)
    Successfully installed jekyll-mentions-1.1.3
    Fetching: jekyll-redirect-from-0.11.0.gem (100%)
    Successfully installed jekyll-redirect-from-0.11.0
    Fetching: jekyll-sitemap-0.10.0.gem (100%)
    Successfully installed jekyll-sitemap-0.10.0
    Fetching: jekyll-feed-0.5.1.gem (100%)
    Successfully installed jekyll-feed-0.5.1
    Fetching: jekyll-gist-1.4.0.gem (100%)
    Successfully installed jekyll-gist-1.4.0
    Fetching: jekyll-paginate-1.1.0.gem (100%)
    Successfully installed jekyll-paginate-1.1.0
    Fetching: coffee-script-source-1.10.0.gem (100%)
    Successfully installed coffee-script-source-1.10.0
    Fetching: execjs-2.7.0.gem (100%)
    Successfully installed execjs-2.7.0
    Fetching: coffee-script-2.4.1.gem (100%)
    Successfully installed coffee-script-2.4.1
    Fetching: jekyll-coffeescript-1.0.1.gem (100%)
    Successfully installed jekyll-coffeescript-1.0.1
    Fetching: jekyll-seo-tag-2.0.0.gem (100%)
    Successfully installed jekyll-seo-tag-2.0.0
    Fetching: jekyll-github-metadata-2.0.2.gem (100%)
    Successfully installed jekyll-github-metadata-2.0.2
    Fetching: terminal-table-1.6.0.gem (100%)
    Successfully installed terminal-table-1.6.0
    Fetching: github-pages-88.gem (100%)
    ---------------------------------------------------
    Thank you for installing github-pages!
    GitHub Pages recently upgraded to Jekyll 3.0, which
    includes some breaking changes. More information:
    https://github.com/blog/2100-github-pages-jekyll-3
    ---------------------------------------------------
    Successfully installed github-pages-88
    Parsing documentation for listen-3.0.6
    Installing ri documentation for listen-3.0.6
    Parsing documentation for jekyll-sass-converter-1.3.0
    Installing ri documentation for jekyll-sass-converter-1.3.0
    Parsing documentation for net-dns-0.8.0
    Installing ri documentation for net-dns-0.8.0
    Parsing documentation for public_suffix-1.5.3
    Installing ri documentation for public_suffix-1.5.3
    Parsing documentation for ethon-0.9.0
    Installing ri documentation for ethon-0.9.0
    Parsing documentation for typhoeus-0.8.0
    Installing ri documentation for typhoeus-0.8.0
    Parsing documentation for addressable-2.4.0
    Installing ri documentation for addressable-2.4.0
    invalid options: -SHN
    (invalid options are ignored)
    Parsing documentation for multipart-post-2.0.0
    Installing ri documentation for multipart-post-2.0.0
    Parsing documentation for faraday-0.9.2
    Installing ri documentation for faraday-0.9.2
    Parsing documentation for sawyer-0.7.0
    Installing ri documentation for sawyer-0.7.0
    Parsing documentation for octokit-4.3.0
    Installing ri documentation for octokit-4.3.0
    Parsing documentation for github-pages-health-check-1.1.0
    Installing ri documentation for github-pages-health-check-1.1.0
    Parsing documentation for mini_portile2-2.1.0
    Installing ri documentation for mini_portile2-2.1.0
    Parsing documentation for pkg-config-1.1.7
    Installing ri documentation for pkg-config-1.1.7
    Parsing documentation for nokogiri-1.6.8-x64-mingw32
    Installing ri documentation for nokogiri-1.6.8-x64-mingw32
    Parsing documentation for i18n-0.7.0
    Installing ri documentation for i18n-0.7.0
    Parsing documentation for thread_safe-0.3.5
    Installing ri documentation for thread_safe-0.3.5
    Parsing documentation for tzinfo-1.2.2
    Installing ri documentation for tzinfo-1.2.2
    Parsing documentation for activesupport-4.2.7
    Installing ri documentation for activesupport-4.2.7
    Parsing documentation for html-pipeline-2.4.2
    Installing ri documentation for html-pipeline-2.4.2
    Parsing documentation for gemoji-2.1.0
    Installing ri documentation for gemoji-2.1.0
    Parsing documentation for jemoji-0.6.2
    Installing ri documentation for jemoji-0.6.2
    Parsing documentation for jekyll-mentions-1.1.3
    Installing ri documentation for jekyll-mentions-1.1.3
    Parsing documentation for jekyll-redirect-from-0.11.0
    Installing ri documentation for jekyll-redirect-from-0.11.0
    Parsing documentation for jekyll-sitemap-0.10.0
    Installing ri documentation for jekyll-sitemap-0.10.0
    Parsing documentation for jekyll-feed-0.5.1
    Installing ri documentation for jekyll-feed-0.5.1
    Parsing documentation for jekyll-gist-1.4.0
    Installing ri documentation for jekyll-gist-1.4.0
    Parsing documentation for jekyll-paginate-1.1.0
    Installing ri documentation for jekyll-paginate-1.1.0
    Parsing documentation for coffee-script-source-1.10.0
    Installing ri documentation for coffee-script-source-1.10.0
    Parsing documentation for execjs-2.7.0
    Installing ri documentation for execjs-2.7.0
    Parsing documentation for coffee-script-2.4.1
    Installing ri documentation for coffee-script-2.4.1
    Parsing documentation for jekyll-coffeescript-1.0.1
    Installing ri documentation for jekyll-coffeescript-1.0.1
    Parsing documentation for jekyll-seo-tag-2.0.0
    Installing ri documentation for jekyll-seo-tag-2.0.0
    Parsing documentation for jekyll-github-metadata-2.0.2
    Installing ri documentation for jekyll-github-metadata-2.0.2
    Parsing documentation for terminal-table-1.6.0
    Installing ri documentation for terminal-table-1.6.0
    Parsing documentation for github-pages-88
    Installing ri documentation for github-pages-88
    Done installing documentation for listen, jekyll-sass-converter, net-dns, public_suffix, ethon, typhoeus, addressable, multipart-post, faraday, sawyer, octokit, github-pages-health-check, mini_portile2, pkg-config, nokogiri, i18n, thread_safe, tzinfo, activesupport, html-pipeline, gemoji, jemoji, jekyll-mentions, jekyll-redirect-from, jekyll-sitemap, jekyll-feed, jekyll-gist, jekyll-paginate, coffee-script-source, execjs, coffee-script, jekyll-coffeescript, jekyll-seo-tag, jekyll-github-metadata, terminal-table, github-pages after 55 seconds
    36 gems installed    
    

Now when I 

    jekyll serve 

I see this message:    
  
    Please add the following to your Gemfile to avoid polling for changes:
      gem 'wdm', '>= 0.1.0' if Gem.win_platform?    

