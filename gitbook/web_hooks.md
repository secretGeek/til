# to have my gitbook be updated whenever I push to the repo

in gitbook, tell it which repository to use:

e.g. in

    https://www.gitbook.com/book/{yourUsername}/{yourBookName}/settings/github


Tell it:

    {yourUserName}/{YourRepo}
    

And to get the webhooks set up....

Under "Integration" heading

    Next to the "Webhook URL" is a "copy to clipboard" button. Click it, to copy your webhook url.
    

Then click "Check Webhooks" -- this takes you to Github. Specifically it takes you to "Webhooks and Services" for your repo, i.e.

    https://github.com/{yourUserName}/{YourRepo}/settings/hooks    


Under "Webhooks" click "Add webhook"

In "Payload URL" paste the "Webhook URL" from above.


Content type -- leave as default (application/json)
Secret -- leave .
Which events -- leave as default (just the push event)

And click "Add Webhook"

Once that is working... when you push your repo... your book will update. 

It might take a minute. If you go to your book while it is building, they show you a "building" page.




