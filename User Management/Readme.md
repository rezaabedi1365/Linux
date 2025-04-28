- /etc/passwd
- /etc/group
- /etc/sudoers
-----------------
- /etc/bash.bashrc
- ~/.profile
- ~/.bashrc
-----------------
```
w
tial -f /var/log/auth.log
```
-----------------
### Userdd
```
useradd -m user1 -s /bin/bash -G root,sudo
sudo passwd user1
```
verify: 
```
grep "user1" /etc/shadow
grep "user1" /etc/group
id -u user1
id -g user1

groups user1
ls /root
cd /
```

### Usermod
```
usermod -aG sudo,root,docker user1
```

### sudoers
```
visudo
nano /etc/sudoers
```

```
user1    ALL=(ALL:ALL) ALL

Sudoers , enable NOPASSWD for all commands
user1    ALL=NOPASSWD: ALL

```
