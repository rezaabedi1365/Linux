
### How to Generate CSR With OpenSSL
* https://phoenixnap.com/kb/generate-openssl-certificate-signing-request  
  - Create RSA Private Key and CSR
   ```
  openssl req -new -newkey rsa:2048 -nodes -keyout [your_domain].key -out your_domain.csr
  ```
  ```
  openssl req -text -in [file_name].csr -noout -verify
  ```
