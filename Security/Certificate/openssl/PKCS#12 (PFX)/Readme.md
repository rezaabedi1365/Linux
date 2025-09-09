
# PFX 


    


# Create PFX

### Method 1 :  
:heavy_check_mark:  Recommend for IIS
- Default cryptography algorithm :
    * Encryption of certificates → 3DES-CBC
    * Encryption of private keys → 3DES-CBC
    * MAC (Message Authentication) → HMAC with SHA-1
```
openssl pkcs12 -export -out certificate.pfx -inkey private.key -in domain.crt -certfile intermediate.crt
```

### method 2 : other protocol for legecy server(server2016)
- Customize cryptography algorithm
    * Encryption of certificates → -certpbe AES-256-CBC
    * Encryption of private keys → -keypbe  AES-256-CBC
    * MAC (Message Authentication) → HMAC with SHA256
```
openssl pkcs12 -export -out certificate.pfx -inkey private.key -in domain.crt -certfile intermediate.crt -certpbe AES-256-CBC -keypbe AES-256-CBC  -macalg SHA256
```
- check cert in windows server2016
```
certutil -dump C:\certificate.pfx
```

### Method 3 :
:x: with chain error in iis

- Create .ca-bundle
  * CA-bundles usually have extensions .pem, .cert , .crt , .ca-bundle file
  * you may have more than one Intermediate
```
-----BEGIN CERTIFICATE-----
intermediate certificate 1
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
intermediate certificate 2 
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
    root certificate
-----END CERTIFICATE-----
````
```
for f in intermediate.crt root.crt; do sed -e '$a\' "$f"; done > fullchain.ca-bundle
```

```
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in domain.crt -certfile fullchain.ca-bundle
```

# verify:
```
 openssl pkcs12 -in certificate.pfx -info
```
------------------------------------------------------------------------------------------------------------------------------
# How to Convert pfx to pem
:x: These certificate start with [Bag Attributes] means export from pfx

### PEM without key
:heavy_check_mark:  Recommend for NGINX
```
openssl pkcs12 -in yourfile.pfx -nokeys -out fullchain.pem
```
### PEM with Cleartext key
```
openssl pkcs12 -in yourfile.pfx -out fullchain_with_key.pem -nodes
```

### leaf certificate 
```
openssl pkcs12 -in yourfile.pfx -clcerts -nokeys -out cert.pem
```

### PEM With Encrypted Privatekey:
```
openssl pkcs12 -in yourfile.pfx -nocerts -out privateEncrypt.pem
```
- Remove persharkey from key
```
openssl rsa -in privateEncrypt.pem -out private.key 
```


