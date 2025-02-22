## How to Resize a Partition on Ubuntu 
https://pimylifeup.com/ubuntu-resize-partition/ 

1- use gparterd 
2-parted 
```
umunt –f /dev/sda 
parted 
```
3-cfdisk 
```
select resize 
resize2fs  /dev/sda3
```
