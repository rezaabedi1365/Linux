### mkdir
```
mkdir ./dir1
mkdir -p ./dir1/dir2/dir3/dir4
```

### cp
```
cp file[123] /tmp
cp file1 file2 file3 /tmp
cp /etc/passwed .
```
- Recurciv : copy directory with its contents 
```
cp -r /etc ~/dir1
```

### mv
```
mv file[123] /tmp
mv file1 file2 file3 /tmp
mv /etc/passwed .
```

### rm
```
rm file1.txct
rm -r ./dir1
rm -rf ./dir2
```


### ls 
```
#show permission sort reverce by time
ls -lhtr
#show permission sort reverce by size
ls -lhSr
```

### echo
```
echo "test"
echo \"test"\
```
### cat
```
cat file1.txt
cat -n file1.txt
```

### tail
```
tail -f /var/log/auth.log
tail -20 /var/log/aoth.log
```

### head
show last 5 line
```
head 5 /var/log/syslog
```
### watch
```
watch "cat /var/log/syslog"
```
### wc
```
wc -l /var/log/syslog
```
