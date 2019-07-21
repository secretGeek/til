# Use nginx to redirect www and non https to bare https

Given any url like *any* of these:

	http://www.example.com
	http://example.com
	https://www.example.com

redirect to this:

	https://example.com

....that is, `https` (not `http`) and "bare" (**no** `www.` before the domain).

(Whether you want to go bare or not is between you and your trusted board of advisors.)


First, though: Why do this at all?

1. For security we want it all to be https`
2. We want a single canonical url, for SEO/traffic/google-juice/google search console purposes.




## nginx config

Here's an nginx config file that does it... 


	server {
		listen 80;
		server_name www.example.com example.com;
		return 301 https://example.com$request_uri;
	}

	server {
		listen 443 ssl;
		server_name www.example.com;
		ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # managed by Certbot
		ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # managed by Certbot
		include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot

		return 301 https://example.com$request_uri;
	}

	server {
		listen 443 ssl; # managed by Certbot
		server_name example.com;
		location / {
			proxy_pass http://localhost:8000;
			proxy_http_version 1.1;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header Upgrade $http_upgrade;
			proxy_set_header Connection keep-alive;
			proxy_set_header Host $host;
			proxy_cache_bypass $http_upgrade;
		}

		ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # managed by Certbot
		ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # managed by Certbot
		include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot

		ssl_dhparam /etc/ssl/certs/dhparam.pem;
	}



After changing nginx config -- test it is ok with:

	sudo nginx -t

And reload it with:

	sudo nginx -s reload

See [more nginx basics here](nginx.md)



## sources

* [serverfault: Remove "www" and redirect to "https" with nginx](https://serverfault.com/questions/258378/remove-www-and-redirect-to-https-with-nginx)


## see also

* [nginx](nginx.md)
* [lets encrypt and certbot](lets_encrypt.md)