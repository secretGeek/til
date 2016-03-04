# Log with template

You can use templates with hg log, for example:

    hg log --template "{date|shortdate},{desc},{author|person}\n"  -l 30

Date and shortdate here are a keyword (date) that is piped to a filter (shortdate).

Author usually contains name followed by email. So the person filter gets just the name. The email filter would get the email.

i use this function, `hgl`, a lot

    function hgl() {
        hg log --template "{date|shortdate},{desc}\n"  -l 30
    }

Templates and Styles work with all "log-like" commands:

 * log
 * outgoing
 * incoming
 * tip
 * parents
 * heads
 * glog



## See also

    hg help template