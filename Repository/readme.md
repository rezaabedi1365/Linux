
# Repository

###### add repo
Remove Lines Based on Regular Expressions 
 
```
install software-properties-common
```
```
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository restricted
sudo add-apt-repository multiverse 
```

```
apt-add-repository -y ppa:ubuntugis/ppa
```

```
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

###### Remove line dosnot contain word
```
:g!/word/d
```
