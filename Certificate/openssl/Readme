### How to generate a self-signed SSL certificate using OpenSSL

```
openssl req -x509 -new -days 365 -nodes -out certs/domain.crt -keyout certs/domain.key

```

```
openssl req -new > cert.csr
openssl rsa -in privkey.pem -out key.pem
openssl x509 -in cert.csr -out cert.pem -req -signkey key.pem -days 1001
cat key.pem>>cert.pem
```
