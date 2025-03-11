### update
```
# update repository 
apt update

# upgrade applicatioins
apt upgrade

# miner upgrade version
apt dist-upgrade

# upgrade major version
do-release-upgrade
```

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
nano /etc/default/grub
```
ipv6.disable=1
#to
GRUB_CMDLINE_LINUX parameters: GRUB_CMDLINE_LINUX="ipv6.disable=1"

#Run the following command to update the grub2 configuration
update-grub
```

### service
```
apt remove --purge telnet
apt remove --purge vsftpd
apt remove --purge samba
```
