
### How to Generate CSR With OpenSSL
* https://phoenixnap.com/kb/generate-openssl-certificate-signing-request  
  - Create RSA Private Key and CSR
   ```
  openssl req -new -newkey rsa:2048 -nodes -keyout [your_domain].key -out your_domain.csr
  ```
  ```
  openssl req -text -in [file_name].csr -noout -verify
  ```
<img width="757" height="344" alt="image" src="https://github.com/user-attachments/assets/630bd27f-8166-45fc-99d9-61f441c4ee2f" />

