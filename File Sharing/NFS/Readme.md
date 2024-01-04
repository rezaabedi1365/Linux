# NFS


```
apt install nfs-kernel-server
```
```
mkdir /root/share_name
chmod 777 /root/nfs_server_side
```
mount on client
/etc/fstab
```
192.168.10.10:/nfs_server_side /nfs_client_side   nfs 
```
```
mount /nfs_client_side
```

show mount point
```
showmount -e 192.168.10.10
```


