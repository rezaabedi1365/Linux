# NFS

### Server Configuration
```
apt install nfs-kernel-server
```
```
mkdir /root/share_name
chmod 777 /root/share_name
```
### mount on Linux client

```
mkdir /mount_share
mount 10.10.12.18:/share_name /mount_share
```
Permanent Mount
```
/etc/fstab
192.168.10.10:/nfs_server_side /nfs_client_side   nfs 
```
```
mount /share_name
```
### mount on Windows client
Mounting NFS on a Windows Client
![(https://www.hpe.com/psnow/resources/ebooks/a00110181en_us_v11/AdministratorGuide/MountingNFSonWindowsClient.html)
Open Start > Control Panel > Programs > Select Turn NFS Service Windows features on or off

```
mount -o 10.10.12.18:/share z:
cd z:/
```

### show mount point
```
showmount -e localhost
showmount -e 192.168.10.10
```
```
df -h
```

