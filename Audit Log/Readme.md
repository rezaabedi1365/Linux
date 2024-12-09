Debian:
```
apt-get install auditd audispd-plugins
```
RPM:
```
yum install audit audit-libs
```

Repelace your Config file as audit.rules to   /etc/audit/rules.d/audit.rules

```
cd /etc/audit/rules.d/
curl -so audit.rules http://10.10.10.11:3333/audit.rules
```
Start service
```
systemctl enable auditd.service
systemctl start auditd.service
```
verify:
```
auditctl -l
```
