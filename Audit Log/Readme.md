Debian:
```
apt-get install auditd audispd-plugins
```
RPM:
```
yum install audit audit-libs
```

Repelace your Config file to as audit.rule to   /etc/audit/audit.rule

```
curl -so audit.rule http://10.10.10.11:3333/audit.rule
```
Start service
```
systemctl enable auditd.service
systemctl start auditd.service
Sudo auditctl -l
```
