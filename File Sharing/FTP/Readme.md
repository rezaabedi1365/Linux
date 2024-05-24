### FTP
Port 20-21

### FTPS
* Port 443
* FTP over SSL/TLS (Certificate) 

### SFTP
* Port 22
* FTP over SSH 
* winscp

### TFTP
* port 69
* without Authentication
* use UDP Port Not Reliable without acknowledge but hith speed

  -----------------------------------------------------------------
# FTP
install
```
apt install vsftpd
apt install pure-ftpd
apt install proftpd
```

Create the ftp folder:
```
sudo mkdir /home/sammy/ftp
#Set its ownership:
sudo chown nobody:nogroup /home/sammy/ftp
#Remove write permissions:
#sudo chmod a-w /home/sammy/ftp
sudo ls -la /home/sammy/ftp
```

```
ufw allow from any to any port 20,21,10000:10100 proto tcp
```
Restart Service
```
 systemctl restart vsftpd
```

Client Side 
* conect to ftp
```
ftp 10.10.12.18
```

* download and upload file
```
get file1.txt
put file2.txt
```
* download and upload direcroty
```
mget dir1

ncftpget -R -v -u reza 10.10.12.18  /home  /tmp/ftp_share/dir1
ncftpput -R -v -u reza 10.10.12.18  /tmp/ftp_share/dir1 /home  
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
d

