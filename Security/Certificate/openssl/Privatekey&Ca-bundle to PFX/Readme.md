

### Generate PFX file from private key and ca-bundle files
* Method1
  - https://serverfault.com/questions/1097033/generate-pfx-file-from-private-key-and-crt-files
  - Combine the CRT files (ServerCertificate.crt then Intermediate.crt then root.crt) into a single ca-bundle file
  - you may have more than one Intermediate
  - CA-bundles usually have extensions .pem, .cert , .crt , .crt file
```
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile bundl.ca-bundle
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile bundle.crt
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile bundl.pem
```

* Method2
  - https://stackoverflow.com/questions/6307886/how-to-create-pfx-file-from-certificate-and-private-key
```
   openssl pkcs12 -export -out domain.name.pfx -inkey domain.name.key -in domain.name.crt -in intermediate.crt -in rootca.crt
```
   if you have two intermediate
```
   openssl pkcs12 -export -out domain.name.pfx -inkey domain.name.key -in domain.name.crt -in intermediate1.crt -in intermediate2.crt-in rootca.crt
```
