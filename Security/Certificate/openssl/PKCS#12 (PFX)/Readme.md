
# PFX 
  - Combine the CRT files (ServerCertificate.crt then Intermediate.crt then root.crt) into a fullchain.ca-bundle file


    
# Create .ca-bundle
  - CA-bundles usually have extensions .pem, .cert , .crt , .ca-bundle file
  - you may have more than one Intermediate
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
````
```
for f in domain.crt intermediate.crt root.crt; do sed -e '$a\' "$f"; done > fullchain.ca-bundle
```

# Create PFX
### Method 1 : with chain error in iis
- Default cryptography algorithm :
    * Encryption of certificates → 3DES-CBC
    * Encryption of private keys → 3DES-CBC
    * MAC (Message Authentication) → HMAC with SHA-1

```
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in domain.crt -certfile fullchain.pem
```

### Method 2 : not use fullchain
```
openssl pkcs12 -export -out certificate.pfx -inkey private.key -in domain.crt -certfile intermediate.crt
```

### method 3 : other protocol for legecy server(server2016)
- :x: in windownserver 2016 password error - import cert in window 10 and export it and create certificate again
    * -keypbe → الگوریتم رمزنگاری برای private key داخل PFX
    * -certpbe → الگوریتم رمزنگاری برای certificateها
    * -macalg → الگوریتم MAC (بهتره SHA256 باشه به جای SHA1)
```
openssl pkcs12 -export -out certificate.pfx -inkey private.key -in domain.crt -certfile intermediate.crt -certpbe AES-256-CBC -keypbe AES-256-CBC  -macalg SHA256
```
- check cert in windows server2016
```
certutil -dump C:\certificate.pfx
```
------------------------------------------------------------------------------------------------------------------------------
# How to Convert pfx to pem
:x: These certificate start with [Bag Attributes] means export from pfx

### PEM with Cleartext key
```
openssl pkcs12 -in yourfile.pfx -out fullchain_with_key.pem -nodes
```
### PEM without key
```
openssl pkcs12 -in yourfile.pfx -nokeys -out fullchain.pem
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
------------------------------------------------------------------------------------------------------------------------------------------
# verify:
```
 openssl pkcs12 -in certificate.pfx -info
```
