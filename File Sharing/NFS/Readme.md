# NFS

### Server Configuration
```
apt install nfs-kernel-server
```
```
mkdir /root/share_name
chmod 777 /root/share_name
```
Configuraion
- [https://ubuntu.com/server/docs/network-file-system-nfs](https://ubuntu.com/server/docs/network-file-system-nfs)

```
vi /etc/exports
/share 192.168.210.0/24 (rw)
/share 10.10.12.0/24 (r,sync)
/share * (rw,async,no_subtree_check,no_root_squash)
```
Restart Configuration
```
exportfs -r
```

### mount on Linux client
```
apt install nfs-common
```
```
mkdir /mount_share
mount 10.10.12.18:/share_name /mount_share
```
Permanent Mount
```
/etc/fstab
192.168.10.10:/nfs_server_side /nfs_client_side   nfs    default    0    0
mount /nfs_client_side
```
```
mount /share_name
```
### mount on Windows client
Mounting NFS on a Windows Client
- [https://www.hpe.com/psnow/resources/ebooks/a00110181en_us_v11/AdministratorGuide/MountingNFSonWindowsClient.html](https://www.hpe.com/psnow/resources/ebooks/a00110181en_us_v11/AdministratorGuide/MountingNFSonWindowsClient.html)

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
du -lh
```

# NFS with Kerberos

- [https://ubuntu.com/server/docs/network-file-system-nfs](https://ubuntu.com/server/docs/network-file-system-nfs)
