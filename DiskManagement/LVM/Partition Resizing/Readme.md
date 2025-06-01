https://packetpushers.net/ubuntu-extend-your-default-lvm-space/
  
# Partition Resizing

- Method1 [ add free space to Disk]
- Method2 [ add New Disk ]
--------------------------------------------------------------------------------------------------------------------
### Mothod1 

#### Step1) Resize Partition table 

cfdisk > type Linux LVM > write > q
```
cfdisk /dev/sdb  # by default cfdisk /dev/sda
```
or fdisk
```
fdisk -cu /dev/sdb
      # g (GPT) o (MBR)
      # n (new)
        # P primary partition (1-4)
        # e extended Partiton 
      # t (change partition type)
            # L (list of partiotion  (30 (Linux LVM))
      # w (write)
```
#### verify
```
fdisk -l /dev/sda
lsblk 
```

-------------------------------------------------------------------------------------------------------------------
### Method2
### Step1) Create Partition table and type lvm
cfdisk > type Linux LVM > write > q
```
cfdisk /dev/sdb  *by default cfdisk /dev/sda
```
or fdisk
```
fdisk -cu /dev/sdb
      # g (GPT) o (MBR)
      # n (new)
        # P primary partition (1-4)
        # e extended Partiton 
      # t (change partition type)
            # L (list of partiotion  (30 (Linux LVM))
      # w (write)
```
# verify
```
fdisk -l /dev/sda
# lvm partition have tree in lsblk
lsblk     
```

![image](https://github.com/user-attachments/assets/9f1eb716-dad1-4e8c-bc17-6ef04f3cc991)

![image](https://github.com/user-attachments/assets/b0530c3b-4425-4dfe-adff-f705f32d8460)

![image](https://github.com/user-attachments/assets/b5664201-a3a6-40bc-b26b-c51088f1b176)

### step2)
```
pvcreate /dev/sdb
#in method1 and add free space to disk
pvresize /dev/sda
```
![image](https://github.com/user-attachments/assets/00ac1966-85c2-4b87-ad8f-961f58426ceb)

### step3)
```
vgextend /dev/ununtu-vg
```
![image](https://github.com/user-attachments/assets/75a5b1d7-4c5d-4492-83fb-435f819969e3)

### step4)
```
lvextend -l +100%Freee /dev/ubuntu-vg/ubuntu-lv
lvextend -l +100%Freee /dev/ubuntu-vg/ubuntu-lv
```
![image](https://github.com/user-attachments/assets/bc1707ff-f8ae-4833-b5e1-8fe9e4a07625)

![image](https://github.com/user-attachments/assets/2c93ebd5-b194-4e24-a505-9c0a8f4b58c6)

### Step5)
```
#for ext/2/3/4
resize2fs -p /dev/ubuntu-vg/unbuntu-lv
#for xfs filesystem
xfs_growfs /dev/ubuntu-vg/ubuntu-lv
```
verity:
```
lsblk
df -h
df -h /dev/sda3
fdisk -l /dev/sda3
```
