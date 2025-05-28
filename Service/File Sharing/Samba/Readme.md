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
Create sabma user : samba user must be created in passwd
```
useradd -md /home/reza -s /bin/bash reza
pdbedit -a -u reza
#delete user
pdbedit -X
smbpasswd -a new_user.
etfacl -R -m "u:new_user:rwx" /home/sharing
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
```
```
#download and upload file
get file_name
put file_name

#download and upload direcroty
mget directory_name
mput directory_name
```


