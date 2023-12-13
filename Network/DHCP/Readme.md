# DHCP to register or update BIND DNS

### /etc/dhcp/
```
ddns-update-style standard;
ddns-rev-domainname "in-addr.arpa.";
deny client-updates;
do-forward-updates on;
update-optimization off;
update-conflict-detection off;
```
