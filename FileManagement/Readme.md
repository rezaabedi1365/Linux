```
ls -l
```
![image](https://github.com/user-attachments/assets/82e68b2e-da19-4d8f-89e5-db94149d7f12)



--------------------------------------------------------------------------------------------------
### umask
![image](https://github.com/user-attachments/assets/35d20ecc-09ce-431e-b4f7-b3de105ec615)

syntax:
```
umask [-p] [-S] [mask]
```
example:
```
umask 000
umask -S u=rwx,g=rwx,o=rwx

umask 111
umask -S u=rw,g=rw,o=rw

umask 222
umask -S u=rx,g=rx,o=rx

umask 444
umask -S u=wx,g=wx,o=wx
```

show 
- default umask (0022 OR u=rwx,g=rx,o=rx)
```
umask
```


### Chmod
sysntex:
```
chmod 1-7,1-7,1-7
chmod u=rwx,g=rwx,o=rwx
```
```
chmod 777 new_file.txt
chmod u=rwx,og=r new_file.txt
chmod a+x new_script.sh
```
Recursively Change
```
chmod +x -R ./testdir
```
----------------------------------------------------------------------------------------------
- u: User, meaning the owner of the file.
- g: Group, meaning members of the group the file belongs to.
- o: Others, meaning people not governed by the u and g permissions.
- a: All, meaning all of the above.

-----------------------------------------------------------------------------------------------
-  -: Minus sign. Removes the permission.
-  +: Plus sign. Grants the permission. The permission is added to the existing permissions. If you want to have this permission and only this permission set, use the = option, described below.
-  =: Equals sign. Set a permission and remove others.

-----------------------------------------------------------------------------------------------

- r: The read permission.
- w: The write permission.
- x: The execute permission.

-----------------------------------------------------------------------------------------------

- 0: (000) No permission.
- 1: (001) Execute permission.
- 2: (010) Write permission.
- 3: (011) Write and execute permissions.
- 4: (100) Read permission.
- 5: (101) Read and execute permissions.
- 6: (110) Read and write permissions.
- 7: (111) Read, write, and execute permissions.



### Chown
```
chown [OPTIONS] USER[:GROUP] FILE(s)
```

```
sudo chown :root example.txt
sudo chown root: example.txt
sudo chown root:root example.txt
```

Recursively Change

```
sudo chown -R root:root ./testdir
```


