# Verify Certificate
- match cert and private key
- Both commands should output the same value. If they don't, you'll need to ensure you're using the correct private key for this certificate.
```
openssl rsa -noout -modulus -in private.key | openssl md5
openssl x509 -noout -modulus -in Star_faradis.net.crt | openssl md5
```

- Check pfx chain
```
openssl pkcs12 -in YourDomain.pfx -nodes -info
```

- Check Csr
```
openssl req -text -in [file_name].csr -noout -verify
```


-------------------------------------------------------------------------------------------------------------------
# Convert Other Format
### Convert DER to PEM
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
