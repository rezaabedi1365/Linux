https://michaelwaterman.nl/2022/10/02/domain-join-ubuntu-22-04-to-active-directory/

https://virgool.io/@devops523/%D8%A2%D9%85%D9%88%D8%B2%D8%B4-%D8%AC%D9%88%DB%8C%D9%86-%DA%A9%D8%B1%D8%AF%D9%86-%D9%84%DB%8C%D9%86%D9%88%DA%A9%D8%B3-debianubuntu-%D8%A8%D9%87-%D8%A7%DA%A9%D8%AA%DB%8C%D9%88%D8%AF%D8%A7%DB%8C%D8%B1%DA%A9%D8%AA%D9%88%D8%B1%DB%8C-%D8%AF%D8%A7%D9%85%DB%8C%D9%86-ajq6cw387sxb

https://tosinso.com/articles/42963/%D8%A2%D9%85%D9%88%D8%B2%D8%B4-%D8%AC%D9%88%DB%8C%D9%86-%DA%A9%D8%B1%D8%AF%D9%86-%D9%84%DB%8C%D9%86%D9%88%DA%A9%D8%B3-%D8%AF%D8%A8%DB%8C%D9%86-(-Debian-)-%D8%AF%D8%B1-%D8%A7%DA%A9%D8%AA%DB%8C%D9%88%D8%AF%D8%A7%DB%8C%D8%B1%DA%A9%D8%AA%D9%88%D8%B1%DB%8C



### Hostname
```
sudo hostnamectl set-hostname <hostname.domain.suffix>
```
chenge it on 
```
sudo nano /etc/hostname
sudo nano /etc/hosts
```

### Networking
sudo nano /etc/netplan/01-network-manager-all.yaml
- cheange
```
nameservers:
    addresses:
    - address: 10.10.10.11
    search: 
    - domain.suffix
```
verify:
```
resolvectl status
```
### Timing is everything
sudo nano /etc/systemd/timesyncd.conf

![image](https://github.com/user-attachments/assets/fff3d06c-65c4-464c-bb5f-1e08cb5231e2)
```
sudo timedatectl set-ntp on
sudo systemctl restart systemd-timesyncd.service
sudo timedatectl --adjust-system-clock
```
verity:
```
sudo timedatectl --adjust-system-clock
```
### Required packages

    - realmd
    - sssd
    - sssd-tools
    - libnss-sss
    - libpam-sss
    - krb5-user
    - adcli
    - samba-common-bin
```
sudo apt -y install realmd sssd sssd-tools libnss-sss libpam-sss krb5-user adcli samba-common-bin
```

### Auto create the home directory
```
sudo pam-auth-update
sudo pam-auth-update --enable mkhomedir
```
![image](https://github.com/user-attachments/assets/22037b05-1223-4734-83dd-0991193fcd84)

### Testing Active Directory access
```
realm list
realm discover water.lab
```
### Joining the Active Directory domain
```
sudo realm join --verbose --user=administrator water.lab
```
![image](https://github.com/user-attachments/assets/00fa9470-63aa-4686-820e-80a0ac474a37)

### Logon with Active Directory credentials
```
sudo nano /etc/sssd/sssd.conf
```
    - add ssh to service 
![image](https://github.com/user-attachments/assets/c2b61bf7-4722-4675-a453-44aed24e1815)

```
sudo systemctl restart sssd
```

### Access user and group to sudoers Group
check read user and group
```
id user01
getent group SeverAdnis
```
    - Method1
        + Edit /etc/sudoers
    - Method2
        + Add /etc/sudoers.d/sample.com
      
```
#Permit access to individual users
user1 ALL=(ALL:ALL) ALL
user1@sample.com ALL=(ALL:ALL) ALL
SMB\\user1 ALL=(ALL:ALL) ALL
SMB\\user1@sample.com ALL=(ALL:ALL) ALL

#Permit access to group – Examples
%ServerAdmins  ALL=(ALL:ALL) ALL
%ServerAdmins@sample.com  ALL=(ALL:ALL) ALL
%Domain^Admins ALL=(ALL) ALL
%sample.com\\ServerAdmins ALL=(ALL) ALL
%ServerAdmins@sample.com ALL=(ALL) ALL

```
with no password
```
user1 ALL=(ALL:ALL) NOPASSWD:ALL
%ServerAdmins ALL=(ALL:ALL) NOPASSWD:ALL
```

![image](https://github.com/user-attachments/assets/0d03c538-b89f-4d97-ae63-88858afa6e29)

realm access
```
#Permit access to individual users
sudo realm permit user1@example.com
sudo realm permit user2@example.com user3@example.com

#Permit access to group – Examples
sudo ream permit -g sysadmins
sudo realm permit -g 'Security Users'
sudo realm permit 'Domain Users' 'admin users'
```
```
sudo realm permit all
```
OR
```
sudo realm deny all
```

```
usermod -aG sudo,root sample.com\\user1
```
```
su admin-abedi@sample.com
```
verify
```
cd /
sudo apt update
```

### Disjoin Domain

```
realm leave water.lab
```

