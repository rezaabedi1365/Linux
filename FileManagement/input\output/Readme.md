
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

* redirect to null
```
date  log.txt   "insert answer to standard output" 1&2>/dev/null
```

----------------------------------------------------
### echo 
```
echo "test" > ./log.txt
echo "test" >> ./log.txt
```
