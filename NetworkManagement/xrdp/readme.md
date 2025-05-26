```
apt install xrdp  
```
```
systemctl enable xrdp  
systemctl start xrdp  
```
  
```
systemctl status xrdp  
```
  
```
netstat –atnp | grep 3389  
ss -lstu | grep 3389
 ```
  
config file
```
nano /etc/xrdp/xrdp.ini  
```
  
ufw
```
ufw aloow from 172.22.0.0/16 proto tcp to any port 3389
```
