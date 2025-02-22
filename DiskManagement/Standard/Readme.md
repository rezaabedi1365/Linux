  
### Disk partition table 
- disk partition table diffrent with partition 
```
fdisk /dev/sdb 
  #g  (gpt ) 
  #o  (dos or mbr)    Default 
```
Remove partiton table 
```
wipefs -a -f /dev/sdb 
```

### Disk 
- Sda
    + Sda1 [Partiton1] 
    + Sda2 [Partiton2] 
    + Sda3 [Partiton3] 
- Sdb 
- Sdc

```
#fdisk  /dev/sdb 
  #Primary /dev/sdb1 
  #Primary /dev/sdb2 
  #Primary /dev/sdb3 
  #Extended /dev/sdb4 
```

### Filesystem  
- Fat
- NTFS
- ext 2/3/4

```
mkfs. 
mkfs.fat  /dev/sdb1 
mkfs.nfts /dev/sdb2 
mkfs.ext3 /dev/sdb3 
mkfs.ext4 /dev/sdb4 
```
 
Verify : 
```
df  -h 
df –T  /    (show filessystem) 
```
```
lsblk
lsblk -o FSTYPE /dev/sda3 
```
```
fdisk –s  /dev/sda  (show disk size) 
fdisk –s /dev/sda1  (show partition size) 
```
```
wipefs /dev/sdb   (show partitioin table) 
```
![image](https://github.com/user-attachments/assets/ecd1dabc-aad6-4ef5-a3d8-82000edd0708)


### Mount Point 

- / 
- /boot 
- /swap 

---------------------------------------------------------------------------------------------------------------------------------------------------------------- 

Partition table : 


 

Partition : 

#fdisk  /dev/sdb 

Primary /dev/sdb1 

Primary /dev/sdb2 

Primary /dev/sdb3 

Extended /dev/sdb4 

 

By default standard installation 

Sda1         1M 

Sda2          /boot/efi 

Sda3          / 

 

Filesystem : 

#mkfs. 

#mkfs.fat  /dev/sdb1 

#mkfs.nfts /dev/sdb2 

#mkfs.ext3 /dev/sdb3 

#mkfs.ext4 /dev/sdb4 

 

Verify : 

#df  -h 

#df –T  /    (show filessystem) 

#lsblk 

#fdisk –s  /dev/sda  (show disk size) 

#fdisk –s /dev/sda1  (show partition size) 

#lsblk -o FSTYPE /dev/sda3 

#wipefs /dev/sdb   (show partitioin table) 

 

 

 

Senario 1 

we can 4 primary partition or 3 primary partition and 1 extended partition (in extended we can create different partition) 

    fdisk  

    #fdisk –l   [ | grep sd  ]                ( show  disk partition ) 

    #fdisk /dev/sdb 

  

Command (m for help):p            (print) 

Command (m for help):w           (write) 

 

    mkfs 

    #mkfs –t ex3 /dev/hda1  

Or  

#mkfs.ex3  /dev/sda1         (apt install xfsprogs) 

  

    mount 

    #mount                             show mount partition  

    #mount –t ex3 /dev/hda1  /home      

    #umount /dev/hda1 /home     =       umount /dev/hda1        =        umount /directory1 

  

    mount –o –ro /dev/hda1               read only partition 

 Or 

    mount –t ex3 /dev/hda1  /directoiry1      -rw 

    mount –o –ro ,noexec /dev/hda1               read only partition 

    moun –o –remonut ,rw /dev/hda1 /directory1/test1 

    ls /media/      list of auto mount device for example flash disk 

  

Permanently mount        (Automaticly  mount )  

 #vi /etc/fstap            add your maunt in latest line for save mout setting 

  

<Device_File>     <Mount_Point>     <File_System>   <Mount_Options>  <Dump_Flag>  <FSCK> 

  

/dev/hda1                   /DISK2/P1                    ext2             defaults                             0                 0 

  

#mount –a      automatic save mount any thing in /etc/fstap 

  

  

 

 

How to Resize a Partition on Ubuntu 

https://pimylifeup.com/ubuntu-resize-partition/ 

1- use gparterd 

2-parted 

#umunt –f /dev/sda 

#parted 

 

3-cfdisk 

#select resize 

#resize2fs  /dev/sda3 

 

 

 

 
