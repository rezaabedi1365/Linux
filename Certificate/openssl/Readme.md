### PFX Converter
- https://www.interssl.com/en/ssl-tools-pfxconverter.php
- https://www.sslshopper.com/ssl-converter.html
- https://www.httpcs.com/en/ssl-converter

### How to Generate CSR With OpenSSL
* https://phoenixnap.com/kb/generate-openssl-certificate-signing-request  
  - Step 2:Create RSA Private Key and CSR
   ```
  openssl req -new -newkey rsa:2048 -nodes -keyout [your_domain].key -out your_domain.csr
  ```
  ```
  openssl req -text -in [file_name].csr -noout -verify
  ```



### How to Convert pfx to pem
https://www.xolphin.com/support/Certificate_conversions/Convert_pfx_file_to_pem_file

##### To convert a PFX file to a PEM file that contains both the certificate and private key, the following command needs to be used:
```
openssl pkcs12 -in filename.pfx -out cert.pem -nodes 
```
 
convert to seperate pem
```
# We can extract the private key form a PFX to a PEM file with this command:
openssl pkcs12 -in filename.pfx -nocerts -out key.pem

# Exporting the certificate only:
openssl pkcs12 -in filename.pfx -clcerts -nokeys -out cert.pem
```
Remove persharkey from key
```
openssl rsa -in key.pem -out server.key 
```
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

### convert DER to PEM
- https://tiloid.com/p/creating-a-pfx-file-from-certificate-and-private-key
```
openssl x509 -inform der -in certificate.der -out certificate.pem
```
```
openssl rsa -inform der -in privatekey.der -out privatekey.pem
```
### convert PKCS#7 to PEM:
```
openssl pkcs7 -print_certs -in your_pkcs7_certificate.p7b -out your_pem_certificates.pem
```
### convert PEM to PKCS#7:
```
openssl crl2pkcs7 -nocrl -certfile your_pem_certificate.crt -out your_pkcs7_certificate.p7b -certfile CA-bundle.crt
```
### convert PKCS#7 to PFX:
Method1
- To convert a certificate from PKCS#7 to PFX, the certificate should be first converted into PEM:
```
openssl pkcs7 -print_certs -in your_pkcs7_certificate.p7b -out your_pem_certificates.pem
```
- After that, the certificate can be converted into PFX.
```
openssl pkcs12 -export -out your_pfx_certificate.pfx -inkey your_private.key -in your_pem_certificate.crt
```
Method2
- STEP 1: Convert P7B to CER
```
openssl pkcs7 -print_certs -in certificatename.p7b -out certificatename.cer
```
- STEP 2: Convert CER and Private Key to PFX
```
openssl pkcs12 -export -in certificatename.cer -inkey privateKey.key -out certificatename.pfx -certfile  cacert.cer
```
### Convert x509 to PEM
openssl x509 -in certificatename.cer -outform PEM -out certificatename.pem

### Convert PEM to DER
openssl x509 -outform der -in certificatename.pem -out certificatename.der


### How to generate a self-signed SSL certificate using OpenSSL

method 1
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout selfsigned.key -out selfsigned.crt
```
method 2
```
# interactive
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365

# non-interactive and 10 years expiration
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 3650 -nodes -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
```
method 3

```
openssl req -new > cert.csr
openssl rsa -in privkey.pem -out key.pem
openssl x509 -in cert.csr -out cert.pem -req -signkey key.pem -days 1001
cat key.pem>>cert.pem
```
