# Partition Resizing
- in Partition Resizing you dont need to filesystem (mkfs.) and mount because before created
- https://packetpushers.net/ubuntu-extend-your-default-lvm-space/

- Method1 [ add free space to Disk]
- Method2 [ add New Disk ]


### Step1) Create Partition table and type lvm
cfdisk > type Linux LVM > write > q
```
cfdisk /dev/sdb  *by default cfdisk /dev/sda
```
or fdisk
```
fdisk -cu /dev/sdb
      # n (new)
        # P primary partition (1-4)
        # e extended Partiton 
          # t (table)
            # 1 to 8e (Linux LVM)
      # w (write)
        
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

