# Register a domain with zoho (aka DNS Text records at digitalocean such as DKIM)

I signed up to Zoho, following this guide:

[How To Set Up Zoho Mail with a Custom Domain Managed by DigitalOcean DNS](https://www.digitalocean.com/community/tutorials/how-to-set-up-zoho-mail-with-a-custom-domain-managed-by-digitalocean-dns)


There were a lot of DNS records to configure.

Main thing I want to show is that when adding a TEXT record to DNS at Digital Ocean (such as the DKIM text record) you don't need to include the domain name, because digital ocean automatically adds it for you.

(And it doesn't matter if you do or don't include the trailing dot -- digital ocean does that for you automatically) 

Hopefully this picture can demonstrate what I'm talking about:

![dkim_dns_digital_ocean](dkim_dns_digital_ocean.png)

If you do put in the domain, it goes bad... look at this stinking hot mess:

![don't put in domain](dkim_dns_digital_ocean_BAD.png)

Of course, I never made that mistake and wasted half my damn night. I'm just showing this in case someone else is less clever than me.