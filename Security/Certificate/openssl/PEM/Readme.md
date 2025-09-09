# PEM

### Split PEM files
 
- Domain.crt
```
-----BEGIN CERTIFICATE-----
    domain certificate
-----END CERTIFICATE-----
```
- intermediate.crt
```
-----BEGIN CERTIFICATE-----
intermediate certificate 1
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
intermediate certificate 2 
-----END CERTIFICATE-----
```
- root.crt
```   
-----BEGIN CERTIFICATE-----
    root certificate
-----END CERTIFICATE-----
```

###### verify cert and private key
- two bellow command must be have same result
```
openssl rsa -noout -modulus -in private.key | openssl md5
```
```
openssl x509 -noout -modulus -in cert.crt | openssl md5
```

### Fullchain clear
```
for f in domain.crt intermediate.crt root.crt; do sed -e '$a\' "$f"; done > fullchain.pem
```

### Encrypted Privatekey with presharekey
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




