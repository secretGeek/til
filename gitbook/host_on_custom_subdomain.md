# Host a gitbook on a custom subdomain

(e.g. http://TIL.secretGeek.net)

By default the book is hosted on http://{author}.gitbooks.io/{book}/
and can be read at https://www.gitbook.com/read/book/{author}/{book}

If you want to host it on a custom sub domain then you may need to add a `cname` record at your webhost. 




Then, at gitbook.com tell it the custom domain.

 * Settings -> 
   * Domains -> 
    * Custom domains -> 
     * For content: TIL.secretGeek.net 
     
## Source

 * https://help.gitbook.com/platform/domains.html

## See Also

 * [Getting started with gitbook](getting_started_with_gitbook.md)
 * [To have your gitbook updated whenever you push to a github repo](web_hooks.md)
 * [Use gitbook locally](use_gitbook_locally.md)

