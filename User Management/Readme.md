```
useradd -m user1 -s /bin/bash -G root,sudo
sudo passwd user1
```
verify: 
```
groups user1
ls /root
cd /
```

```
usermod -aG sudo,root,docker user1
```
```
visudo
```

```
    /etc/sudoers
          user1    ALL=(ALL:ALL) ALL

Sudoers , enable NOPASSWD for all commands
user1    ALL=NOPASSWD: ALL

```
