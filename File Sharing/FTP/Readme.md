# FTP

* /etc/vsftpd.conf
* /etc/vsftpd.userlist
* /etc/nsswitch.conf
* /etc/pam.d

  -----------------------------------------------------------------
```
apt install vsftpd
```
```
ufw allow from any to any port 20,21,10000:10100 proto tcp
```

```
 systemctl restart vsftpd
```
