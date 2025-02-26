
### Redirection
- 0: Standard input (keyboard)
- 1: standard output(screen)
- 2: standard error (screen)
---------------------------------------------------
stdout redirect 1>
- insert success to standard output
```
date > log.txt    
#or
date 1> log.txt   
```

stderr redirect 2>
-  insert error to standard output
```
date 2> log.txt  
```

strout & stderr redirect 2>&1 
- insert success and error to standard output
```
date  > log.txt 2>&1  
```

redirect to null
```
date > log.txt   /dev/null
#or
date > log.txt   1&2>/dev/null
```

redirect output command to input other command
```
ls -l /etc | wc -l
ls -l /etc | grep ab
```
----------------------------------------------------
Redirecton with echo 
```
echo "test" > ./log.txt
echo "test" >> ./log.txt
```
