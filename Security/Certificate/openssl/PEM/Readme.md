# Generate PEM
- split PEM files
    * root.crt + intermeditae.crt + Domain.crt
      
- Fullchain or PEM Bundle
```
for f in domain.crt intermediate.crt root.crt; do sed -e '$a\' "$f"; done > fullchain.pem
```
```
-----BEGIN CERTIFICATE-----
    domain certificate
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
intermediate certificate 1
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
intermediate certificate 2 
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
    root certificate
-----END CERTIFICATE-----
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

# verify
```
openssl x509 -in fullchain.pem -noout -text
```
```
openssl x509 -in fullchain.pem -noout -enddate
openssl x509 -in fullchain.pem -noout -startdate
```

