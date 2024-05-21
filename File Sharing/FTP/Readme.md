# FTP
Port 20-21

* /etc/vsftpd.conf
* /etc/vsftpd.userlist

* /etc/nsswitch.conf
* dir /etc/pam.d/

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

Encrypt Password
/etc/login.dfs
  * ENCRYPT_METHOPD SHA512

```
apt install whois
mkpasswd -m sha-512 "mypassword"
```
OR
```
useradd -md /home/reza -s /bin/bash 
```


```
ufw allow from any to any port 20,21,10000:10100 proto tcp
```

```
 systemctl restart vsftpd
```
## /etc/vsftpd.conf

```
listen=NO
 listen ipv6=YES 
anonymous_enable=NO
 local_enable=YES 
write_enable=YES
 local_umask=022
 dirmessage_enable=YES 
use_localtime=YES xferlog_enable=YES
 connect_from_port_20=YES
 chroot_local_user=YES 
secure_chroot_dir=/var/run/vsftpd/empty 
pam_service_name=vsftpd 
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
 rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
 ssl_enable=NO 
pasv_enable=Yes 
pasv_min_port=10000 
pasv_max_port=10100 
allow_writeable_chroot=YES
```
* /etc/vsftpd.userlist
```
userlist_enable=YES
userlist_file=/etc/vsftp.user_list
userlist_deny=NO
```
### Authentication

  ![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/e829a450-5365-4614-bc92-0b17c8b51635)

  ![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/f88b87fa-9c42-48af-9154-227aeaa0e626)


  ![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/799ec595-fc43-42f5-96fe-ad890f8a0ef5)


# FTPS
FTP over SSL/TLS (Certificate) Port 443


# SFTP
FTP over SSH Port 22

# TFTP
Port 69
Without Authentication
use UDP Port Not Reliable without acknowledge But Hith speed

