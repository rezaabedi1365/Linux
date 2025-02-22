- https://linuxconfig.org/how-to-mount-cdrom-in-linux 
- https://www.linuxfordevices.com/tutorials/linux/mount-usb-drives-in-linux 
  
```
lsblk 
fdisk -l 
blkid 

mkdir /mnt/cdrom 
mount /dev/sr0   /mnt/cdrom
```
