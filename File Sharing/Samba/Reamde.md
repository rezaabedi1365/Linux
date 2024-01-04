# Samba (smb or CIFS)
* smbd
* nmbd  ( wins )
* winbindd (join linux to Windows Domain)

```
apt install samba 
```
```
systemctsl status smbd
```
### Configuration files
* /etc/samba/smb.conf
  
```
[global]
    workgroup = METRAN
    encrypt passwords = yes
    wins support = yes
    log level = 1 
    max log size = 1000
    read only = no
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
    read only = no
    writable = yes
    browseable = yes
    guest ok = no
    valid users = @saraz @new_user
```
###  Set Up a User Account
```
smbpasswd -a new_user.
```
```
sudo setfacl -R -m "u:new_user:rwx" /home/sharing
```
