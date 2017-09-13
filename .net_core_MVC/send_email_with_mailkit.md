# To send email with .net core, use Mailkit

.net core (1.0) doesn't include the same email sending stuff, so you need to install 3rd party packages, such as [Mailkit](https://github.com/jstedfast/MailKit) (add it via nuget).

You also cannot currently use OAuth2 for this. (Discussion much lower down)



    var message = new MimeMessage();
    message.From.Add(new MailboxAddress(null, settings.SendMailFromAddress));
    message.To.Add(new MailboxAddress(null, email));
    message.Subject = subject;
    message.Body = new TextPart("plain")
    {
        Text = body
    };

    using (var client = new SmtpClient())
    {
        client.Connect(settings.SendMailFromHost, settings.SendMailSMTPPort, settings.SendMailViaSSL);
        // Note: since we don't have an OAuth2 token, disable
        // the XOAUTH2 authentication mechanism.
        client.AuthenticationMechanisms.Remove("XOAUTH2");
        // Note: only needed if the SMTP server requires authentication
        client.Authenticate(settings.SendMailFromAddress, settings.SendMailFromPassword);
        client.Send(message);
        client.Disconnect(true);
    }



I got this working fairly easily (sending email from a dedicated gmail address) from my local machine -- but it failed from my digitalocean linux droplet:

    MailKit.Security.AuthenticationException: Authentication failed.
       at MailKit.Net.Smtp.SmtpClient.Authenticate(Encoding encoding, ICredentials credentials, CancellationToken cancellationToken)
       at MailKit.MailService.Authenticate(String userName, String password, CancellationToken cancellationToken)

...with google reporting:

> Subject: Someone has your password	
> Message: Someone just used your password to try to sign in to your Google Account using an application such as an email client or mobile device.


And if you visit: <https://security.google.com/settings/security/activity> you will see an "Unknown device" and this message:

> We recently prevented a sign-in attempt from this device. You indicated this attempt as yours. For your security, we'll continue to show this device in the list for two weeks. You can also review this event in your Notification & alerts page.

And:

> Sign in attempt prevented by google

...which, if you expand, will reveal the IP Address (and a map of the location), which you should recognise as your droplet.

    
To get around this you need to login as that email address, from your desktop/regular machine, and then visit this url:

 * <https://accounts.google.com/b/0/UnlockCaptcha>
 
Leave that url open, and re-initiate the connection on your linux box. (i.e. get your digital ocean droplet to try once again to send an email)

It should now succeed.


## OAuth2


There's a few funtime examples that say you should do something like this...


        var certificate = new X509Certificate2(@"C:\path\to\certificate.p12", "password", X509KeyStorageFlags.Exportable);
        var credential = new ServiceAccountCredential(new ServiceAccountCredential
            .Initializer("your-developer-id@developer.gserviceaccount.com")
        {
            // Note: other scopes can be found here: https://developers.google.com/gmail/api/auth/scopes
            Scopes = new[] { "https://mail.google.com/" },
            User = "username@gmail.com"
        }.FromCertificate(certificate));
                
But .net core doesn't yet have an implementation of 'ServiceAccountCredential' -- so you can't use OAuth2 for this yet (unless you write all the necessary plumbing code yourself)

So you need to ensure your gmail account permits signin without use of a developer token. To enable this for your gmail account, you may need to (login as that user and then) visit:

 * <https://www.google.com/settings/security/lesssecureapps>
                

## Sources

 * [serverfault question on same](http://serverfault.com/questions/541314/unlocking-server-ip-via-googles-displayunlockcaptcha-over-ssh)