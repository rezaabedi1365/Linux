Debian:
```
apt-get install auditd audispd-plugins
```
RPM:
```
yum install audit audit-libs
```

add content Config file to  /etc/audit/auditd.conf file

محتوای فایل configaudit.conf را داخل فایل /etc/audit/auditd.conf اضافه می کنیم. سپس دستورات زیر را اجرا می کنیم. ``
```
cd /etc/audit/auditd.conf/
curl -so configaudit.conf http://10.10.10.11:3333/configaudit.conf
```
Start service
```
systemctl enable auditd.service
systemctl start auditd.service
Sudo auditctl -l
```
