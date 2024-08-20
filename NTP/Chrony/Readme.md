
```
apt install chrony
```

### Server
nano /etc/chrony/chrony.conf
```
pool ntp.ubuntu.com        iburst maxsources 4
pool 0.ubuntu.pool.ntp.org iburst maxsources 1
pool 1.ubuntu.pool.ntp.org iburst maxsources 1
pool 2.ubuntu.pool.ntp.org iburst maxsources 2

driftfile /var/lib/chrony/drift
makestep 1 3
rtcsync
keyfile /etc/chrony.keys
leapsectz right/UTC
log measurements statistics tracking
logdir /var/log/chrony
allow 192.168.165.0/24
```

verify:
```
chronyc sources
netstat -ntlup 
```

 ### lient with timedatectl (timesyncd)

 nano /etc/systemd/timesyncd.conf
      * NTP=10.10.12.18
 ```
timedatectl timesync-status
systemctl status systemd-timesyncd
#
timedatectl set-ntp false
timedatectl set-ntp true
hwclock --systohc
timedatectl set-local-rtc 0

# 
systemctl restart systemd-timesyncd
timedatectl status
timedatectl timesync-status
# 
timedatectl list-timezone | grep Tehran
timedatectl set-timezone "Asia/Tehran"
```



 



