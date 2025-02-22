# Volume 
### Standard Partition 
- Disk
    + Partition table 
- Partition 
    + Filesystem 
- Mount point 

### LVM Partition 

- Disk 
    + Partition table for lvm by default is devtmpfs 
- Phisical Volume  (PV)                   
- Volume Group    (VG)    
- Logical Volume   (LV)         
    + Filesystem 
- Mount point 

# Partition Table
- MBR (dos) 
- GPT 

![image](https://github.com/user-attachments/assets/ed8920c1-f1e6-4e28-9558-4d6f7d3d459b)
```
fdisk  
```
![image](https://github.com/user-attachments/assets/76e39bf0-c3d2-4a0e-ad76-572cc3b79c4e)

# File System Type 
![image](https://github.com/user-attachments/assets/98f51cc6-07e2-49a9-8405-bfde437f17b2)

#### Windows
- NTFS              Windows 
```
mkfs.ntfs  /dev/sdb1 
```
 - FAT 16/32     Standard 
```
mkfs.fat /dev/sdb2 
mkfs.vfat /dev/sdb3 
```
 #### Linux  

- ext2   Non-Journaling File System
- ext3/4 Journaling File Syste 
```
mkfs.ex4 /dev/sdb4 
```
##### Other 
- JFS                  IBM 
- HFS                 Apple 

