# Generate PEM
- split PEM files
    * root.crt + intermeditae.crt + Domain.crt
      
- Fullchain or PEM Bundle
```
for f in domain.crt intermediate.crt root.crt; do sed -e '$a\' "$f"; done > fullchain.pem
```

- nginx 
```
ssl_certificate     /path/to/nginx_ssl/fullchain.pem;
ssl_certificate_key /path/to/nginx_ssl/private.key;
```
# Encrypted Privatekey with presharekey
- not use in nginx and apache
```
openssl genrsa -aes256 -passout pass:MYPASSWORD -out private.key 2048
```



