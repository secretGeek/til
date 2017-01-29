## Which version

You can open the Internet information Services (IIS) Manager, and go to Help | About.

Or run this in powershell:

    get-itemproperty HKLM:\SOFTWARE\Microsoft\InetStp\  | select setupstring,versionstring
    
## Source

 * [Finding Version of IIS using powershell](http://stackoverflow.com/questions/16784587/finding-version-of-iis-using-powershell)