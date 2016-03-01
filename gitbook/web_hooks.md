# To have your gitbook updated whenever you push to a github repo

in gitbook, tell it which repository to use:

e.g. in

> https://www.gitbook.com/book/{yourUsername}/{yourBookName}/settings/github


Tell it your github repository:

    {yourUserName}/{YourRepo}
    

And to get the webhooks set up....

 * Under "Integration" heading
    * Next to the "Webhook URL" is a "copy to clipboard" button. Click it, to copy your webhook url.
    

Then click "Check Webhooks" -- this takes you to Github. Specifically it takes you to "Webhooks and Services" for your repo, i.e.

    https://github.com/{yourUserName}/{YourRepo}/settings/hooks    


 * Under "Webhooks" click "Add webhook"
  * In "Payload URL" paste the "Webhook URL" from above.
  * Content type -- leave as default (application/json)
  * Secret -- leave .
  * Which events -- leave as default (just the push event)

And click "Add Webhook"

Once that is working... when you push your repo... your book will update. 

It might take a minute. If you go to your book while it is building, they show you a "building" message.

> Your book is currently being updated, this can take up to a few minutes.



## See Also

 * [Getting started with gitbook](getting_started_with_gitbook.md)
 * [Use gitbook locally](use_gitbook_locally.md)
 * [Host a gitbook on a custom subdomain](host_on_custom_subdomain.md)

