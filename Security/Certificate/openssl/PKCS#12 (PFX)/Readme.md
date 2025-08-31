
# Generate PFX 
  - Combine the CRT files (ServerCertificate.crt then Intermediate.crt then root.crt) into a fullchain file
  - you may have more than one Intermediate
  - CA-bundles usually have extensions .pem, .cert , .crt , .ca-bundle file
```
cat domain.crt intermediate.crt root.crt > fullchain.pem
cat domain.crt intermediate-cert.crt intermediate-root.crt root.crt > fullchain.pem
```
- Method 1 : whth chain error in iis
```
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile fullchain.pem
```
- Method 2 : not use fullchain
```
openssl pkcs12 -export -out faradis3.pfx -inkey private.key -in Star_faradis.net.crt -certfile intermediate.crt
```
------------------------------------------------------------------------------------------------------------------------------
# How to Convert pfx to pem
  - To convert a PFX file to a PEM file that contains both the certificate and private key, the following command needs to be used:
```
openssl pkcs12 -in yourfile.pfx -out fullchain.pem -nodes

openssl pkcs12 -in faradis_wild1404-5.pfx -nokeys -out fullchain2.pem
openssl pkcs12 -in faradis_wild1404-5.pfx -clcerts -nokeys -out cert.pem
```
### convert to seperate pem
- Export certificate
- These certificate start with [Bag Attributes] means export from pfx
     * fullchain
     * only server certificate
```
## fullchain
openssl pkcs12 -in yourfile.pfx -nokeys -out fullchain2.pem
### server certificate
openssl pkcs12 -in yourfile.pfx -clcerts -nokeys -out server.crt
```

- Export Envrypted Privatekey:
```
openssl pkcs12 -in yourfile.pfx -nocerts -out privateEncrypt.pem
```


Remove persharkey from key
```
openssl rsa -in privateEncrypt.pem -out private.key 
```
------------------------------------------------------------------------------------------------------------------------------------------
