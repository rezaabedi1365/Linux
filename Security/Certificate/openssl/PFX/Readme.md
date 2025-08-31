

# Generate PFX file from private key and ca-bundle files
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
------------------------------------------------------------------------------------------------------------------------------




### How to Convert pfx to pem
https://www.xolphin.com/support/Certificate_conversions/Convert_pfx_file_to_pem_file

##### To convert a PFX file to a PEM file that contains both the certificate and private key, the following command needs to be used:
```
openssl pkcs12 -in yourfile.pfx -out cert.pem -nodes
openssl pkcs12 -legacy -in yourfile.pfx -out cert.pem -nodes

```
 
convert to seperate pem
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
Error
* 40C7C43E0D7F0000:error:0308010C:digital envelope routines:inner_evp_generic_fetch:unsupported:../crypto/evp/evp_fetch.c:349:Global default library context, Algorithm (RC2-40-CBC : 0), Properties ()
Permanent fix (optional)

* If you want OpenSSL to always load legacy algorithms, you can modify the OpenSSL configuration file (openssl.cnf) to activate the legacy provider:

- Add or modify these sections:
```
text
[provider_sect]
default = default_sect
legacy = legacy_sect

[default_sect]
activate = 1

[legacy_sect]
activate = 1
```
Then set the environment variable OPENSSL_CONF to point to this config file before running OpenSSL commands

------------------------------------------------------------------------------------------------------------------------------------------


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
