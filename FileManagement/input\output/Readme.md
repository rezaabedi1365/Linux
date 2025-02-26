
### Redirection
- 0: Standard input (keyboard)
- 1: standard output(screen)
- 2: standard error (screen)

* stdout redirect 1>
```
date > log.txt    "insert answer to standard output"
#or
date 1> log.txt   "insert answer to standard output"

* stderr redirect 2>
```
date 2> log.txt   "insert answer to standard output"
```
* strout & stderr redirect 2>&1 
```
date  log.txt   "insert answer to standard output" 2>&1
```


```
date >> log.txt 2>&1
```
----------------------------------------------------
### echo 
```
echo "test" > ./log.txt
echo "test" >> ./log.txt
```
