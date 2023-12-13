

# How Generate key for secure transfer zone

### Transaction SIGnitures (TSIG)
Generate key on master DNS and send it with scp to slave DNS
```
tsig-keygen -a hmac-sha512 dnskey
```
Output:

```
key "dnskey" {
        algorithm hmac-sha512;
        secret "ylSw8yq98XYHfqXrmbbqF9tQ07ck7PekYQ6jF1H1vP1OrDIQckA0b/0OuGe2sFPpj+HCGg/cE1Pj4Viyi8r09w==";
};

```








