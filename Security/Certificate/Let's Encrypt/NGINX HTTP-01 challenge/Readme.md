# Let's Encrypt in nginx
Step1) Downloading and Installing Certbot
```
apt-get update
sudo apt-get install certbot
apt-get install python-certbot-nginx
```

Step2) Setting Up Nginx
- :x: your server with port 80 published and accessible in internet
```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    server_name pam.sanbod.net www.pam.sanbod.net;
```
```
nginx -t && nginx -s reload
```
Step3) Obtaining the SSL/TLS Certificate
```
sudo certbot --nginx -d pam.sanbod.net -d www.pam.sanbod.net
```
```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    server_name  example.com www.example.com;

    listen 443 ssl; # managed by Certbot
```

# Certificate Path
```
ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # managed by Certbot
ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # managed by Certbot
```
include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot


# Automatically Renewing Let’s Encrypt Certificates
crontab -e
```
0 12 * * * /usr/bin/certbot renew --quiet
```
