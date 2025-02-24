# LVM
https://blog.victormendonca.com/2020/11/18/linux-logical-volume-manager/

![image](https://github.com/user-attachments/assets/d4bbe4bb-0bcc-435f-9394-7a565ea99749)

![image](https://github.com/user-attachments/assets/9cabe764-546a-4514-aa7c-646f7b959519)


### Step 1) Phisical Volume System ID to LVM ---> "8e" 

### Step 2) Create Physical Volume(PV) 
```
pv  (show pvs command)
pvcreate /dev/hda1 /dev/hda2 /dev/sdb2 
```

Verify:
```
pvs or  #pvdisplay 
```

```
pvremove  
pvresize 
wipefs -a -f /dev/sdb 
```

### Step 3) Create Volume Group(s): 
```
vgcreate VG1  /dev/hda1 /dev/hda2 /dev/sdb2 
```

verify:
```
vgs  or #vgdisplay 
```
```
vgrename vg01   vg02 
vgremove vg02 
vgreduce vg02  /dev/hda1 
vgextend vg02 /dev/hda1 
```
 
### Step 4) Create Logical Volume(s): 
```
lvcreate -n    LV1    -L     20GB         VG1 
lvcreate -n    LV2    -L     10GB         VG1 
lvcreate –n    LV3    -l   100%FREE       VG2 
```

Verify:
```
lvs or #lvdisplay 
lvremove      vg01    lv01 
```

### Step 5) Format LV(s) 
```
mkfs.ext3 /dev/VG1/LV1 
mkfs -t ext3 /dev/VG1/LV2 
```

### Step 6) Mount LV(s) 
```
mkdir /P1 ; mkdir /P2 
mount /dev/VG1/LV1 /P1 ; mount /dev/VG1/LV2 /P2 
```
Permanent Mount Points 
```
fdisk -a 
  /dev/VG1/LV1   /P1      ext3    defaults  0 0  
  /dev/VG1/LV2   /P2      ext3    defaults  0 0 
```
 
 



