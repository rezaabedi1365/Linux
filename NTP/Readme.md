
verify:
```
w32tm /query /source
w32tm /query /peers 
w32tm /query /status
w32tm /query /configuration
```

reconfig 
```
w32tm /config /update
```
batch script:

```
@echo off
w32tm /config /syncfromflags:DOMHIER /reliable:YES /update
w32tm /resync /nowait
net stop w32time
net start w32time 
EOF
```
set specefic ntp server
```
w32tm /config /syncfromflags:manual /manualpeerlist:"[server]" /reliable:YES /update

```
NTP Server in windows

```
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer" /v Enabled /t REG_DWORD /d 1 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers " /v 1 /t REG_SZ /d 10.10.12.18 /f 
```
check conectivity:
```
gpresult /h c:/result.html
w32tm /stripchart /computer:ad.domaintest.net
```
install and unistall w32tm service 
```
w32tm /unregister
w32tm /register
```

HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tzautoupdate

w32tm /config /manualpeerlist:time.google.com /syncfromflags:manual /reliable:yes /update
w32TM /config /syncfromflags:manual /manualpeerlist:ntp.indiana.edu
 
w32tm /resync /rediscover

