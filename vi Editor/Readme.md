
# Vi 

## Delete Line
######  Remove Lines Based on Regular Expressions 
```
:g!/word/d
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
