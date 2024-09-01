

# Create CSR

 ####  Step 1: Creating private keys and certificates
```
openssl genrsa -des3 -out key_name.key key_strength
openssl genrsa -des3 -out private_key.key 2048
```
Enables password for the private key:
```
openssl rsa -des3 -in path_to_private_key.key -out key_name.key
```

 ####  Create a certificate signing request (CSR)
```
openssl req -new -key path_to_private_key.key -out csr_name.csr
openssl req -new -key private_key.key -out CSR.csr
```
![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/b3393492-ef01-4307-9385-1b01f2a643a8)

 ####  Step 2: Signing certificates


# Converting pfx to pem using openssl
https://www.xolphin.com/support/Certificate_conversions/Convert_pfx_file_to_pem_file
### Conversion to a combined PEM file
To convert a PFX file to a PEM file that contains both the certificate and private key, the following command needs to be used
```
openssl pkcs12 -in filename.pfx -out cert.pem -nodes 
```
### Conversion to separate PEM files
We can extract the private key form a PFX to a PEM file with this command:
```
openssl pkcs12 -in filename.pfx -nocerts -out key.pem
```
Exporting the certificate only:
```
openssl pkcs12 -in filename.pfx -clcerts -nokeys -out cert.pem 
```

Removing the password from the extracted private key
```
openssl rsa -in key.pem -out server.key 
```
