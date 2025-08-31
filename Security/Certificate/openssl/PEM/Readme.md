# Generate PEM
```
cat domain.crt intermediate.crt root.crt > fullchain.pem
```
```
cat private.key domain.crt intermediate.crt root.crt > server.pem
```


