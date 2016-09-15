# When does your windows account's password expire?

The command to see this info is:

    net user {userName} /DOMAIN
    
Where "{userName}" is your username.

I misread this and thought that /DOMAIN should be /{DOMAIN NAME} ... which led to an "access is denied" message. /DOMAIN is literally "/DOMAIN"



