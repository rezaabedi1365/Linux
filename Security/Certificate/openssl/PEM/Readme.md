# PEM

### split PEM files
:heavy_check_mark:  
- Domain.crt
```
-----BEGIN CERTIFICATE-----
    domain certificate
-----END CERTIFICATE-----
```
- intermeditae.crt
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


### Fullchain 
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




