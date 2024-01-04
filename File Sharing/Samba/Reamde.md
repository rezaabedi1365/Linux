# Samba (smb or CIFS)
https://phoenixnap.com/kb/ubuntu-samba
* smbd
* nmbd  ( wins )
* winbindd (join linux to Windows Domain)

```
apt install samba
apt install samba-client
```
```
systemctsl status smbd
```
```
ufw allow samba
```
smb://ip-address/sharing
```
smbclient -L 192.168.10.10 -U reza
smbclient //192.168.10.10 -U reza
```
### Configuration files
* /etc/samba/smb.conf
* /var/lib/samba/private/passdb.tdb
  
```
[global]
    workgroup = METRAN
    encrypt passwords = yes
    wins support = yes
    log level = 1 
    max log size = 1000
    read only = no    
  ### Networking #####
    interfaces= ens160
    bind interfaces only= yes
  ### Debuging #####
    log file = /var/log/samba/log.%m
    max log size = 1000
    logging = file
    panic action = /usr/share/samba/panic-action %d
  ### Authentication, Domain, and Misc #####
    server role = standalone server
    obey pam restrictions = yes
    unix password sync = yes
    passwd program = /usr/bin/passwd
    passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
    pam password change = yes
    map to guest = bad user
    usershare allow guests = yesCopied!


[homes] 
    browsable = no
    map archive = yes

[printers] 
    path = /var/tmp
    printable = yes
    min print space = 2000

[test]
    comment = Samba share directory
    path = /home/sharing
    read only = no   // or writable = yes
    browseable = yes
    guest ok = no
    valid users = @saraz @new_user
```
check for syntax errors:
```
testparm
```
###  Set Up a User Account
samba user must be created in passwd
```
grep -E 'reza' /etc/passwd
```
##### pdbedit
show users
```
pdbedit -L
```
add user
```
useradd -md /home/reza -s /bin/bash reza
```
```
pdbedit -a -u reza
```

Detete users
```
pdbedit -X
```
##### smbpasswd
```
smbpasswd -a new_user.
```
```
sudo setfacl -R -m "u:new_user:rwx" /home/sharing
```
