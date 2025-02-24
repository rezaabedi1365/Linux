# Partition Resizing
- https://packetpushers.net/ubuntu-extend-your-default-lvm-space/ 
- Method1 [ add free space to Disk]
- Method2 [ add New Disk ]

```
cfdisk
```
  
```
pvs or  #pvdisplay
    #/dev/sda3
vgs  or #vgdisplay
    #ubuntu/vg  access:Read/Write  status:resizeble
lvs or #lvdisplay
    #/dev/ubuntu-vg/ubuntu-lv
```

### Method1 [ add free space to Disk]
```
cfdisk
```

### Method2 [ add New Disk ]

```
cfdisk /dev/sdb  *by default cfdisk /dev/sda
```

![image](https://github.com/user-attachments/assets/9f1eb716-dad1-4e8c-bc17-6ef04f3cc991)
![image](https://github.com/user-attachments/assets/b0530c3b-4425-4dfe-adff-f705f32d8460)
![image](https://github.com/user-attachments/assets/b5664201-a3a6-40bc-b26b-c51088f1b176)


