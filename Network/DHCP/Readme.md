# DHCP to register or update BIND DNS

### /etc/dhcp/dhcpd.conf
```
ddns-updates on;
ddns-update-style interim;     //ignore client-updates;
ignore client-updates;
ddns-domainname "home.local";
ddns-rev-domainname "in-addr.arpa.";
deny client-updates;
do-forward-updates on;
update-static-leases on;
update-optimization off;
update-conflict-detection off;
key rndc-key { algorithm hmac-sha256; secret "FxU11YBMFyXP8evP1Ei0zw==";}
```


## Method 2

```
cd /etc/dhcp  
mkdir ddns-keys  
sudo nano ddns-keys/dhcp1.key  
```
```
```
```
```
```
```
