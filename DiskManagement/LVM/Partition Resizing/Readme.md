# Partition Resizing
- https://packetpushers.net/ubuntu-extend-your-default-lvm-space/ 
- Method1 [ add free space to Disk]
- Method2 [ add New Disk ]
  
```
pvs or  #pvdisplay
    #/dev/sda3
vgs  or #vgdisplay
    #ubuntu/vg  access:Read/Write  status:resizeble
lvs or #lvdisplay
    #/dev/ubuntu-vg/ubuntu-lv
```







- command line 
```
lvextend 
gvextend 
resize2fs 
```
- cfdisk 
- gparted 

-----------------------------------------------------------------------------------------------------------------
