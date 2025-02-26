
### ssh
- /etc/ssh/sshd_config
```
PermitEmptyPasswords no
ClientAliveInterval 300
ClientAliveCountMax 3
UsePAM yes
PermitRootLogin no
```

### ufw 
```
ufw status
ufw enable
ufw allow
```

### ipv6
```
```

### service
---
apt remove --purge telnet
apt remove --purge vsftpd
apt remove --purge samba
---
