# FTP
Port 20-21

* /etc/vsftpd.conf
* /etc/vsftpd.userlist

  -----------------------------------------------------------------
```
apt install vsftpd
```
OR 
```
apt install pure-ftpd
```
OR
```
apt install proftpd
```

```
ufw allow from any to any port 20,21,10000:10100 proto tcp
```

Restart Service
```
 systemctl restart vsftpd
```
## /etc/vsftpd.conf

```
listen=NO
anonymous_enable=NO
local_enable=YES

write_enable=YES

#default path in ftp is home users by below directive you can change it
local_root=/tmp/ftp_share

dirmessage_enable=YES 
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
secure_chroot_dir=/var/run/vsftpd/empty

pam_service_name=vsftpd
userlist_enable=YES
userlist_file=/etc/vsftpd.userlist
userlist_deny=no


 rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
 rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
 ssl_enable=NO
```
/etc/ftpusers
```
# /etc/ftpusers: list of users disallowed FTP access. See ftpusers(5).
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
nobody
```
Client Side 
```
ftp 10.10.12.18
get file1.txt
put file2.txt
```
### Authentication

  ![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/e829a450-5365-4614-bc92-0b17c8b51635)

  ![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/f88b87fa-9c42-48af-9154-227aeaa0e626)

* /etc/nsswitch.conf (set priority to authentication )

  ![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/799ec595-fc43-42f5-96fe-ad890f8a0ef5)

create user with Encrypt Password
* /etc/login.dfs
  * ENCRYPT_METHOPD SHA512
```
useradd -md /home/reza -s /bin/bash 
```

* add user ti vsftpd.userlist
  * nano /etc/vsftpd.userlist    (use /etc/passwd and /etc/shadow)
# FTPS
FTP over SSL/TLS (Certificate) Port 443


# SFTP
FTP over SSH Port 22
winscp
```

```

# TFTP
Port 69
Without Authentication
use UDP Port Not Reliable without acknowledge But Hith speed

