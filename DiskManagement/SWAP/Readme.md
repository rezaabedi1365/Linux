
# swap 

*Swap in windows sysdm.col>advance>performance > virtual memry – c:/pagefile.sys 

- swap partition   
- swapfile  

-----------------------------------------------------------------------------  
### Step 1) Create Partition throue swap partition 

                fdisk /dev/hda 

### Step 2) Change Partition System ID to "82" using Switch "t" 

### Step 3) Create Swap Space/File System 

                    #mkswap /dev/hda7 

### Step 4) Attach Swap Partition into Kernel 

                   #swapon /dev/hda7 

### Step 5) Verify Swap Space 

                  #swapon -s 
                  

------------------------------------------------------------------------------
# Note: Disable Swap ----> #swapoff /dev/hda7 
```
swapon –s 
```

### Step 1) Create Used File 
```
dd if=/dev/zero of=/root/myswapfile bs=1024 count=102400     [zerioize] 
```
### Step 2) Create Swap Space on File 
```
mkswap /root/myswapfile 
```

### Step 3) Active Swap 
```
swapon /root/myswapfile 
```

### Step 4) Verify Swap  
```
swapon -s 
```


# Permanent Swap 
```
/etc/fstab 
/dev/hda1         swap        swap        defaults 0 0
```
