### Kernel setting
/etc/sysctl.conf
```
sysctl net.ipv6.bindv6only
#to effect the change.
sudo sysctl -p
```
if set to 1 then only ipv6 connection are allowed
```
sysctl -w net.ipv6.bindv6only=0
```

### show services
```
service --status-all

systemctl list-units
sudo systemctl list-units --state running
```

### systemctl 
```
systemctl cat ssh
systemctl status ssh
systemctl start ssh
systemctl restart ssh
systemctl reload ssh
systemctl stop ssh
systemctl enable ssh
systemctl disable ssh
```



### service 
```
```

### jurnalctl
```
```
