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
----------------------------------------------------------------------------------------
# How to Convert pfx to pem
  - To convert a PFX file to a PEM file that contains both the certificate and private key, the following command needs to be used:
```
openssl pkcs12 -in yourfile.pfx -out cert.pem -nodes
openssl pkcs12 -legacy -in yourfile.pfx -out cert.pem -nodes
```
  - convert to seperate pem
```
# We can extract the private key form a PFX to a PEM file with this command:
openssl pkcs12 -in yourfile.pfx -nocerts -out privatekey.pem
openssl pkcs12 -legacy -in yourfile.pfx -nocerts -out privatekey.pem

# Exporting the certificate only:
openssl pkcs12 -in yourfile.pfx -clcerts -nokeys -out certificate.crt
openssl pkcs12 -legacy -in yourfile.pfx -clcerts -nokeys -out certificate.crt

```
Remove persharkey from key
```
openssl rsa -in key.pem -out server.key 
```

