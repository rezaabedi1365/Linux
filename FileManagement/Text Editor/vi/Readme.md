
# Vi 
- Normal Mode (ESC Key)
   * Delete line    [dd]
   * cut    line    [d]
   * copy   line    [yy]
   * pase   line    [p]
   * search [/]
      + Next  [n]
      + back  [N]
      + Replace

- Insert Mode (INS Key)
  
- Visual Mode (v or ctrl+v)
   * copy     [y]
   * paste    [p]
   * delete   [d]
   * undo     [u]
   * redo     [ctrl+u]
   * go to start line [gg]
   * go to end   line [G]
     
- Command-Line Mode  (: Key)
   * Save              [w] 
   * Exit with save    [wq] 
   * Exit              [q] 
   * Exit without Save [q!] 






## Delete and Repelace
Remove Lines Based on Regular Expressions 
###### Remove line contain word
```
:g/word/d
```
###### Remove line dosnot contain word
```
:g!/word/d
```
Find and Replace
###### Find first word after curser and repelace with word2
```
:s/word/word2
```
###### Find all word in file and replace with word2
```
:%s/word/word2
```


######  Deleting Multiple Lines in Vi and Vim 

```
:[start],[end]d
:.,5d # deletes lines between the current line and the fifth line
:.,$d # removes all lines starting from the current line till the end
:%d # clears all line
```




