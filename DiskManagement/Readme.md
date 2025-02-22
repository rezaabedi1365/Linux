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


# File System Type 
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
  
- JFS                  IBM 
- HFS                 Apple 

