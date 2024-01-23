

# Create certificates
https://www.mailhardener.com/kb/how-to-create-a-dkim-record-with-openssl

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


