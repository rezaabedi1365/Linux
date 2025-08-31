# Generate PEM
- split PEM files
    * root.crt + intermeditae.crt + Domain.crt
      
- Fullchain
```
cat domain.crt intermediate.crt root.crt > fullchain.pem
```
- PEM Bundle
```
cat private.key domain.crt intermediate.crt root.crt > server.pem
```

- nginx use fullchain and privatekey
```
ssl_certificate     /path/to/nginx_ssl/fullchain.pem;
ssl_certificate_key /path/to/nginx_ssl/private.key;
```

