# Generate PEM
```
cat domain.crt intermediate.crt root.crt > fullchain.pem
```
- not use in nginx
```
cat private.key domain.crt intermediate.crt root.crt > server.pem
```

- nginx
```
ssl_certificate     /path/to/nginx_ssl/fullchain.pem;
ssl_certificate_key /path/to/nginx_ssl/private.key;
```

