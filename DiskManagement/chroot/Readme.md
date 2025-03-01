https://help.ubuntu.com/community/DebootstrapChroot


### Step 1: Install packages on the host computer.
```
sudo apt-get install debootstrap
```
```
sudo apt-get install schroot
```
### Step 2: Create a configuration file for schroot.
```
  [hardy_i386]
  description=Ubuntu 8.04 Hardy for i386
  directory=/srv/chroot/hardy_i386 #syntax since Lucid
  #location=/srv/chroot/hardy_i386 #syntax before Lucid
  #personality=linux32
  root-users=bob
  #run-setup-scripts=true #this no longer has any effect
  #run-exec-scripts=true  #this no longer has any effect
  type=directory
  users=alice,bob,charlie
```

### Step 3: Run debootstrap.
```
sudo mkdir -p /srv/chroot/hardy_i386
sudo debootstrap --variant=buildd --arch=i386 hardy /srv/chroot/hardy_i386 http://archive.ubuntu.com/ubuntu/
```
```
sudo debootstrap --arch=amd64 hardy /srv/chroot/hardy_amd64/ http://archive.ubuntu.com/ubuntu/
```
```
sudo debootstrap --arch=amd64 sid /srv/chroot/sid_amd64/ http://ftp.debian.org/debian/
```

### Step 4: Check the chroot
```
schroot -l
schroot -c hardy_i386 -u root
lsb_release -a
