# Bash Basics
_structure of shell command:_

`CommandName [-arg1name] [arg1value] [-arg2name] [arg2value] filename`

### cat
`cat data.txt` this will print the entire file in the terminal even if the file is too big to open in notepad++

### Head and Tail
`head data.txt` print 1st ten lines

`tail data.txt` prints the last ten lines

`head -n 3 data.txt` prints 1st 3 lines

### Piping "|"
Provides a way to use basic commands in a consecutive manner.
eg `cat data.txt | head`

### wc
shell command that __counts the number of lines(-l), words(-w) or characters(-c) in a given file__

`wc -l data.txt`

### grep
if you want to print lines in your file with a particular word. Regular expression can also be used with grep

eg. `grep "2010|Expense" data.txt | head`

### sort
the options for sort are:
- `-t`: Which delimiter to use?
- `-k`: Which column to sort on?
- `-n`: If you want Numerical Sorting. Dont use this option if you want Lexographical sorting.
- `-r`: If you want to sort Descending. Ascending by Default.

eg. `sort -t ";" -k 5 -r -n data.txt | head -10`

### cut
this command can select certain columns from the data.

options are:
- `-d`: Which delimiter to use?
- `-f`: Which column/columns to cut?

eg. `cut -d ";" -f 1,2,5 data.txt | head`

### uniq
command removes sequential duplicates. used with sort can get distinct values in the data.
for example  to find 10 distinct names in data: `cat data.txt | cut -d ";" -f 2 | sort | uniq | head`

if used with `-c` similar to __count distinct__:
`cat data.txt | cut -d ";" -f 2 | sort | uniq -c | head`

### Other useful Utility Commands
#### Change delimiter in a file
_Find and Replace Magic_: Replace certain characters in file with something else using the tr command.
eg. `cat data.txt | tr '|' ',' | head -4`

#### Sum of a column in a file
`awk`find the sum of a column. Divide it by the number of lines and you can get the mean.
`cat data.txt | awk -f "|" '{sum +=$5} END { printf sum}'`

#### Find files in a directory
eg find all .txt files that _start with lowercase h_ `find . -name "h*.txt"`

to find all .txt files _starting with h regardless of case_, use regex `find . -name "[Hh]*.txt"`

#### Pass file list as Argument
if you just use a pipe, any command/utility receives data on STDIN (the standard input stream) as a raw pile of data that it can sort through one line at a time. However some programs don't accept their commands on standard in. For example the rm command(which is used to remove files), touch command(used to create file with a given name) or a certain python script you wrote(which takes command line arguments). They expect it to be spelled out in the arguments to the command.

`find . -name "[hH]*.txt" | rm` won't work

To get around it we can use the `xargs` command which reads the STDIN stream data and converts each line into space separated arguments to the command.

`find . -name "[hH]*.txt" | xargs`

then you can delete files starting with "h", but better to first see the files with `xargs` than to remove blindly

`find . -name "[hH]*.txt" | xargs rm`

another use: used with grep __find all files that contain a certain string__

find . -name "*.txt" | xargs grep 'dear John'

Another use for this can be for __passing arguments to a python script__

#### Output to a new file `>` append to an existing file `>>`
cat data.txt | tr '|' ',' > newdata.txt

note `>` newdata.txt will replace and overwrite if existing file.

[source](http://mlwhiz.com/blog/2015/10/09/shell_basics_for_data_science/)
