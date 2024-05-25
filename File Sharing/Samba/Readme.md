# Samba (smb or CIFS)
https://phoenixnap.com/kb/ubuntu-samba
* smbd
* nmbd  ( wins )
* winbindd (join linux to Windows Domain)
--------------------------------------------------------------------------
install samba
```
apt install samba
apt install smbclient
```
show service status
```
systemctl status smbd
systemctl status nmbd
```

```
#chceck syntax eroor
testparm
#show smb connection
smbstatus
```
Create sabma user 
```
useradd -md /home/reza -s /bin/bash reza
pdbedit -a -u reza

```
show samba users
```
grep -E 'reza|zahra' /etc/passwd
pdbedit -L
```

```
ufw allow samba
```
smb://ip-address/sharing
```
smbclient -L 192.168.10.10 -U reza
smbclient //192.168.10.10 -U reza

get file_name
put file_name
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
