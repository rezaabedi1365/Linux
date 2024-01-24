

# Certbot
https://www.clusterednetworks.com/blog/post/common-certbot-commands
#### /var/log/letsencrypt/letsencrypt.log)

 ####  Install a New Certificate
```
certbot --apache -d www.faratest.com
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

