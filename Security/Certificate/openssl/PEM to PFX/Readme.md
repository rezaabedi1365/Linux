 
### Generate PEM to PFX  
- Combine the CRT files (ServerCertificate.crt then Intermediate.crt then root.crt) into a single chain.pem file
- CA-bundles usually have extensions .pem, .cert , .crt , .crt file
```
openssl.exe pkcs12 -in chain.pem -inkey PRIVATEKEY.key -export -out myPrivateCert.pfx
```
```
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in chain.pem
```
```
openssl pkcs12 -export -out certificate.pfx -inkey privatekey.pem -in certificate.pem
```
