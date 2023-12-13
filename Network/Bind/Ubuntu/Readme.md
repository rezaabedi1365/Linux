

# How Generate key for secure transfer zone

### Transaction SIGnitures (TSIG)
Generate key on master DNS and send it with scp to slave DNS
----------------------------------------------------------
### Generate key in named.conf.tsig
```
tsig-keygen -a hmac-sha512 dnskey  > /etc/bind/named.conf.tsig
```
Output:

```
key "dnskey" {
        algorithm hmac-sha512;
        secret "ylSw8yq98XYHfqXrmbbqF9tQ07ck7PekYQ6jF1H1vP1OrDIQckA0b/0OuGe2sFPpj+HCGg/cE1Pj4Viyi8r09w==";
};

```
### Add file path in named.conf
```
echo " include "/etc/bind/named.conf.tsig" " >> /etc/bind/named.conf
```

### add transfer method in specific zone in master
/etc/bind/named.conf.local
```
allow-transfer ( key "dnskey"; )
```
### add transfer method in slave
/etc/bind/named.conf
```
key "dnskey" {
        algorithm hmac-sha512;
        secret "ylSw8yq98XYHfqXrmbbqF9tQ07ck7PekYQ6jF1H1vP1OrDIQckA0b/0OuGe2sFPpj+HCGg/cE1Pj4Viyi8r09w==";
};

server 10.10.11.110 {
        keys { dnskey; };
 };

```
### Reload BIND Config file

```
rndc reload
```
## Verify:
```
grep -i transfer /var/log/messages
```







