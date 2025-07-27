### Mount Partition 
```
mkdir warmdb
mkdir colddb
```

```
mount /dev/sdb0 /warmdb
sudo blkid
```
###### /etc/fstab

- auto/noauto: controls whether the partition is mounted automatically on boot (or not).
- exec/noexec: controls whether or not the partition can execute binaries. In the name of security, this is usually set to noexec.
- ro/rw: controls read and write privileges - ro = read-only, where rw= read-write.
- nouser/user: controls whether or not the user has mounting privileges. This defaults to noexec for all user accounts.
```
UUID="DasfTW-oE9E-G0vu-9FAQ-n4sA-uJ1E-2G6igg" /mnt/warmdb ext4 default 0 2 
```
Test for check config
```
mount -a
df -h
```



### Mount CDROM  
- https://linuxconfig.org/how-to-mount-cdrom-in-linux 
```
lsblk 
fdisk -l 
blkid 

mkdir /mnt/cdrom 
mount /dev/sr0   /mnt/cdrom
```

### MOunt USB
- https://www.linuxfordevices.com/tutorials/linux/mount-usb-drives-in-linux 
