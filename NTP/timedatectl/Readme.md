### timedatectl

sudo nano /etc/systemd/timesyncd.conf

![image](https://github.com/user-attachments/assets/fff3d06c-65c4-464c-bb5f-1e08cb5231e2)
```
sudo timedatectl set-ntp on
sudo systemctl restart systemd-timesyncd.service
```
verity:
```
sudo timedatectl --adjust-system-clock
```
- timezone
```
timedatectl list-timezone | grep Tehran
timedatectl set-timezone "Asia/Tehran"
```

----------------------------------------------------------
### Error:
Failed to start systemd-timesyncd.service: Unit systemd-timesyncd.service is masked.
```
 sudo systemctl unmask systemd-timesyncd.service
```

```
apt install systemd-timesyncd
```
