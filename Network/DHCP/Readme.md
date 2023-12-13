# DHCP to register or update BIND DNS
```
cd /etc/dhcp  
mkdir ddns-keys  
sudo nano ddns-keys/dhcp1.key  
```
### /etc/dhcp/dhcpd.conf
```
include "/etc/bind/rndc.key";
\\ key rndc-key { algorithm hmac-sha256; secret "FxU11YBMFyXP8evP1Ei0zw==";} *youcan enter key direct in config file or use incude

authoritative;
ddns-updates on;
ddns-update-style interim;
ddns-rev-domainname "in-addr.arpa.";
option domain-name "home.local";
option domain-name-servers 192.168.5.200;
ignore client-updates;
update-static-leases on;
use-host-decl-names on;



zone aohq.local. {
  primary 192.168.5.200;
  key rndc-key;
}
zone 5.168.192.in-addr.arpa. {
  primary 192.168.5.200;
  key rndc-key;
}

subnet 192.168.5.0 netmask 255.255.255.0 {
  pool
  {
    range 192.168.5.100 192.168.5.199;
  }

  option subnet-mask 255.255.255.0;
  option routers 192.168.5.254;
}
```
