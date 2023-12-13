# DHCP to register or update BIND DNS

### /etc/dhcp/dhcpd.conf
```
ddns-updates on;
ddns-update-style standard;   //ddns-update-style interim;
ddns-domainname "home.local";
ddns-rev-domainname "in-addr.arpa.";
deny client-updates;
do-forward-updates on;
update-static-leases on;
update-optimization off;
update-conflict-detection off;
key rndc-key { algorithm hmac-sha256; secret "FxU11YBMFyXP8evP1Ei0zw==";}
```
