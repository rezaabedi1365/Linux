

# Certbot
https://www.clusterednetworks.com/blog/post/common-certbot-commands
#### /var/log/letsencrypt/letsencrypt.log)

 ####  Install a New Certificate
```
certbot --apache
certbot --apache -d www.faratest.com
```
```
certbot --nginx
certbot --nginx -d www.faratest.com
```
nginx plugin:
```
sudo apt install certbot python3-certbot-nginx
```
apache plugin:
```
sudo apt install certbot python3-certbot-apache
```
Install Let’s Encrypt with IIS on Windows Server 2019
```
https://www.snel.com/support/how-to-install-lets-encrypt-with-iis-on-windows-server-2019/
https://github.com/win-acme/win-acme
```
#### Renew Certificates
```
sudo certbot renew
certbot certonly --force-renew -d example.com
```

 ####  Delete a Certificate
```
certbot --apache -d yourdomain.com
certbot --apache -d yourdomain.com -d www.yourdomain.com
```

 ####  List the Certificates installed on a server
 ```
sudo certbot certificates

 ```
#### Certbot Auto-Renewal
```
sudo nano /etc/cron.daily/certbot-renew
sudo chmod +x /etc/cron.daily/certbot-renew
```
```
#!/bin/sh
if certbot renew > /var/log/letsencrypt/renew.log 2>&1 ; then
   /etc/init.d/apache2 reload >> /var/log/letsencrypt/renew.log
fi
exit
```
```
sudo crontab -e
01 02,14 * * * /etc/cron.daily/certbot-renew
```
Verifying Certbot Auto-Renewal:
```
sudo systemctl status certbot.timer
sudo certbot renew --dry-run --agree-tos
```
