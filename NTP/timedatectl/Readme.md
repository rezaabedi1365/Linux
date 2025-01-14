### timedatectl
configuration
- nano /etc/systemd/timesyncd.conf
```
NTP= ntp.sample.com
FallbackNTP=
```
- verify
```
timedatectl timesync-status
systemctl status systemd-timesyncd
```
- RTC
```
timedatectl set-ntp false
timedatectl set-ntp true
hwclock --systohc
timedatectl set-local-rtc 0
```
- Service
```
systemctl restart systemd-timesyncd
timedatectl status
timedatectl timesync-status
```
- timezone
```
timedatectl list-timezone | grep Tehran
timedatectl set-timezone "Asia/Tehran"
```

----------------------------------------------------------
