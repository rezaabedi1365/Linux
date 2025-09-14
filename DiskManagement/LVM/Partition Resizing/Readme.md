https://packetpushers.net/ubuntu-extend-your-default-lvm-space/
  
# Partition Resizing

- Method1 [ add free space to Disk]
- Method2 [ add New Disk ]

--------------------------------------------------------------------------------------------------------------------
### Mothod1 

#### Step1) Resize Partition table 
- Change disk in vmware
```
for host in /sys/class/scsi_host/host*; do 
    echo "- - -" > $host/scan 
done
```
cfdisk > type Linux LVM > write > q
```
cfdisk /dev/sdb  # by default cfdisk /dev/sda
```
- or parted (in fdisk you must first delete old partition and crate new size partition_
```
parted /dev/sda
      # print
      # partitionresize 
        # disk Number (show in print in last step)
        # 150GB (final size)
      # quit
```
verify
```
fdisk -l /dev/sda
lsblk 
```
#### Step2) resize pv
```
pvresize /dev/sda3
pvs
pvdisplay
```
#### Step3)  assign pv to vg
```
in this method before assigned
```

#### Step4) change lv size
```
sudo lvextend -l +100%FREE /dev/<vg_name>/<lv_name>
```
#### Step5) Resize the filesystem
for ext/2/3/4
```
resize2fs -p /dev/ubuntu-vg/unbuntu-lv
```
for xfs filesystem
```
xfs_growfs /dev/ubuntu-vg/ubuntu-lv
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
verify
```
fdisk -l /dev/sdb
lsblk     
```

### step2) Create pv
```
pvcreate /dev/sdb
```
![image](https://github.com/user-attachments/assets/00ac1966-85c2-4b87-ad8f-961f58426ceb)

### step3) assign pv to vg
```
sudo vgextend <vg_name> /dev/sdb
```
![image](https://github.com/user-attachments/assets/75a5b1d7-4c5d-4492-83fb-435f819969e3)

### step4) resize lv
```
sudo lvextend -l +100%FREE /dev/<vg_name>/<lv_name>
```
![image](https://github.com/user-attachments/assets/bc1707ff-f8ae-4833-b5e1-8fe9e4a07625)

![image](https://github.com/user-attachments/assets/2c93ebd5-b194-4e24-a505-9c0a8f4b58c6)

### Step5) Resize the filesystem
show file system
```
lsblk -f
```
for ext/2/3/4
```
resize2fs -p /dev/ubuntu-vg/unbuntu-lv
```
for xfs filesystem
```
xfs_growfs /dev/ubuntu-vg/ubuntu-lv
```

