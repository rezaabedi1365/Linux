
# Generate PFX 
  - Combine the CRT files (ServerCertificate.crt then Intermediate.crt then root.crt) into a fullchain file
  - you may have more than one Intermediate
  - CA-bundles usually have extensions .pem, .cert , .crt , .ca-bundle file
```
cat domain.crt intermediate.crt root.crt > fullchain.pem
cat domain.crt intermediate-cert.crt intermediate-root.crt root.crt > fullchain.pem
```
```
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile bundl.pem
```

------------------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------------------------------------
