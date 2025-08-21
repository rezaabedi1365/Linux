


# Package Management
### How to Create a List of Installed Packages on Ubuntu

----------------------------------------------------------
dpkg :
```
sudo dpkg -l | grep [Package Name]
```

apt list:

```
sudo apt list –-installed | grep [Package Name]
```
apt show :
```
apt show [Package Name]
```


### Add file path in named.conf
```
echo " include "/etc/bind/named.conf.tsig" " >> /etc/bind/named.conf
```



