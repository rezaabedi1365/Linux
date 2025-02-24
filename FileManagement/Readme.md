```
ls -l
```
### umask
```
umask [-p] [-S] [mask]
```
![image](https://github.com/user-attachments/assets/6460d989-5c47-40cf-81ad-3e2fc4d602b0)



### Chmod
sysntex:
```
u=#,g=#,o=#
u=rwx,g=rwx,o=rwx
```
```
chmod u=rw,og=r new_file.txt
```

- u: User, meaning the owner of the file.
- g: Group, meaning members of the group the file belongs to.
- o: Others, meaning people not governed by the u and g permissions.
- a: All, meaning all of the above.

-  -: Minus sign. Removes the permission.
-  +: Plus sign. Grants the permission. The permission is added to the existing permissions. If you want to have this permission and only this permission set, use the = option, described below.
-  =: Equals sign. Set a permission and remove others.

```
chmod a+x new_script.sh
```

- r: The read permission.
- w: The write permission.
- x: The execute permission.

```
chmod 777 new_script.sh
```

- 0: (000) No permission.
- 1: (001) Execute permission.
- 2: (010) Write permission.
- 3: (011) Write and execute permissions.
- 4: (100) Read permission.
- 5: (101) Read and execute permissions.
- 6: (110) Read and write permissions.
- 7: (111) Read, write, and execute permissions.

Recursively Change
```
chmod +x -R ./testdir
```

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


