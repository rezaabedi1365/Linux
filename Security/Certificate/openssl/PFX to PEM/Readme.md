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

