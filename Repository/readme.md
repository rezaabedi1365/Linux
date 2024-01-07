
# Repository

###### add repo
 
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
-----------------
#### install docker
```
url -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
method 1)
```
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

 method 2)
```
echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null![image](https://github.com/rezaabedi1365/LinuxConfigFile/assets/117336743/bf1dae99-d40d-414e-bd79-e0e675f0fa10)

```


