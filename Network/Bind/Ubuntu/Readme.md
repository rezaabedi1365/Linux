

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
# How Generate key for  ِِDynamic DNS updates
https://forums.freebsd.org/threads/dynamic-dns-with-bind-and-isc-dhcp-server.33849/

### Generate key

```
ddns-confgen -a hmac-SHA256 -z faradis.net
```
output:
```
key "ddns-key.faradis.net" {
        algorithm hmac-sha256;
        secret "be5m8stoqlH/xChHb03zx12FdmYSJUK0NnRsOfTRiN4=";
};

```
### Add the ddns-key.mydomain key to /etc/bind/named.conf.local 
```
key "ddns-key.faradis.net" {
        algorithm hmac-sha256;
        secret "be5m8stoqlH/xChHb03zx12FdmYSJUK0NnRsOfTRiN4=";
};

zone "myzone" {
    type master;
    file "/etc/bind/faradis.res.zone";
    update-policy {
        grant ddns-key.faradis.net zonesub any;
    };
};

zone "1.168.192.in-addr.arpa" {
    type master;
    file "/etc/namedb/dynamic/reverse-zone-file";
    update-policy {
        grant ddns-key.mydomain zonesub any;
    };
};

```

###  Testing dynamic DNS updates
add record
```
# nsupdate -k ddns-key.mydomain
> update add testhost.mydomain 3600 A 192.168.1.200
> send
> ^D
```
Delete record
```
# nsupdate -k ddns-key.mydomain
> update delete testhost.mydomain
> send
> ^D
```
