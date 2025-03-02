
### ls 
```
#show permission sort reverce by time
ls -lhtr
#show permission sort reverce by size
ls -lhSr
```
### du
```
du [option] [directory-or-file]
```
```
du -h --max-depth=1 /opt
du -h --max-depth=1 /opt/services
du -h --max-depth=1 /opt/services/mssql/

du --summarize --human-readable *
du -sh *
```

* -h, --human-readable	  __Shows file/directory size in a human-friendly format.
* -s, --summarize	        __Shows only total size of specified directories rather than breaking down the sizes for each subdirectory and file within them.
* -S, --separate-dirs	    __Excludes subdirectories.
* -x, --one-file-system   __Skips directories on different file systems.
* -a, --all	              __Shows sizes for files as well as directories.
* -c, --total	            __Displays the total disk usage in the last line.
* -X, --exclude=[pattern]	__Excludes files/directories that match the specified [pattern].
* d, --max-depth=[N]	    __Limits the depth of the directory tree du travels to [N] levels.
* --time	                __Shows the last modification time for any file or directory.
* –apparent-size  	      __Prints apparent size and disregards the additional space occupied by metadata.

### tree
```
tree [options]
```

- Combine tree with du
```
tree -h --du ./example1
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







