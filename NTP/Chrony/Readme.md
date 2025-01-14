
```
apt install chrony
```

### Server
nano /etc/chrony/chrony.conf
```
# Ntpserver address
pool ntp.ubuntu.com iburst 
#OR
server ntp.ubuntu.com iburst

# is a file that stores the estimated clock frequency error(drift)of system clock.
# measures in part per mollion (PPM)
driftfile /var/lib/chrony/drift

# this directive used to foce a step adjustment of the system clock if the time offset is larger than a specified threshold.
# this is particularly useful when the clock is significantly out of sync at startup or during tintime and requires a quick correction.
makestep 1 3

# this directive used to synchronize the Real-Time Clock(RTC) with the system clock.
# this ensures that the hardware clock (RTC) is updated whith the correct time whenever the system clock is adjusted by chrony.
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
chronyc sourcestats
netstat -ntlup 
```

```
nc -vz -u 10.1.0.100 123
```

 ### Client 
with config file:
 * nano /etc/chrony/chrony.conf
```
server 10.10.12.18 iburst
driftfile /var/lib/chrony/drift
keyfile /etc/chrony.keys
log measurements statistics tracking
logdir /var/log/chrony
```
```
nano /etc/systemd/timesyncd.conf
 * NTP=10.10.12.18
 ```


### with timedatectl:
verify
```
timedatectl timesync-status
systemctl status systemd-timesyncd
```
RTC
```
timedatectl set-ntp false
timedatectl set-ntp true
hwclock --systohc
timedatectl set-local-rtc 0
```
Service
```
systemctl restart systemd-timesyncd
timedatectl status
timedatectl timesync-status
```
timezone
```
timedatectl list-timezone | grep Tehran
timedatectl set-timezone "Asia/Tehran"
```

----------------------------------------------------------
nano /etc/systemd/timesyncd.conf
```
NTP= ntp.sample.com
FallbackNTP=
```

 



