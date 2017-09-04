# How To Secure Nginx with Let's Encrypt on Ubuntu 16.04

 
    sudo apt-get update
    sudo apt-get install letsencrypt


    sudo nano /etc/nginx/sites-available/default
    

Add to SSL server block
        location ~ /.well-known {
                allow all;
        }


    sudo nginx -t
    
    sudo systemctl restart nginx

    
You also need to know the webroot-path, e.g. 

    /var/www/html



    sudo letsencrypt certonly -a webroot --webroot-path=/var/www/html -d example.com -d www.example.com


The newly created files:

 * `cert.pem`: Your domain's certificate
 * `chain.pem`: The Let's Encrypt chain certificate
 * `fullchain.pem`: cert.pem and chain.pem combined
 * `privkey.pem`: Your certificate's private key


...are placed here:

    /etc/letsencrypt/archive

    
## Source

 * [How To Secure Nginx with Let's Encrypt on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04)
