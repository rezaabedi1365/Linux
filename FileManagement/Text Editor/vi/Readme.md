
# Vi 
- Normal Mode
   * Deleter line [dd]
   * copy line    [yy]
   * pase [p]
   * search [/]
      + Next  [n]
      + back  [N]
      + Replace
   * 
   * 
- Insert Mode
- Visual Mode
   * copy     [y]
   * paste    [p]
   * delete   [d]
- Command-Line Mode
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
######  How to Delete a Single Line in Vi/Vim 
Hitting dd or D multiple times will delete several lines one by one.

## cut , copy , past Lines

* dd - detelte line
* d  - cut line
* yy - copy line
* p  - past line

## Select
 * V - select line
 * v + arrow keys - selection
   
## Undo / Redo 
* u  - Undo
* ctrl+r - Redo

## Page 
* gg - Go to first line file
* G  - Go to last line in file

