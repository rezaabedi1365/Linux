```
ls -l
ls -a
ls -h
ls -lha
```

### Chmod

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


### Chown



