
### ls 
```
#show permission sort reverce by time
ls -lhtr
#show permission sort reverce by size
ls -lhSr
```
### du
```
du -h --max-depth=1 /opt
du -h --max-depth=1 /opt/services
du -h --max-depth=1 /opt/services/mssql/
```
```
du --summarize --human-readable *
du -sh *
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
### cut
```
# -c: character culumn 6-12
cut -c 6-12 file1.txt

# -f:
cut 

# -d: Delimiter
# default delimiter is tab
cut -f 1,5,6,7 /etc/passwd
cut -d":" -f 1,5,6,7 /etc/passwd
```
```
redirection
cut -d":" -f1,5,6,7 /etc/passwd > ./log.txt
```
--------------------------------------------------------------

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

------------------------------------------------------------------
### echo
```
echo "test"
echo \"test"\
```







