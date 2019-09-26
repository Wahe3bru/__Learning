# Regular Expression

## Basic RegEx
pattern|match
---|---
.|any Character besides newline (\n)
`\.`| fullstop
a|only `a`
`\\`| \
`\*`|* character

The `.` (dot) operator is useful when used in combination with other operators.
example finding a 6 letter word that starts with w/W and ends in b:<br>
`r'[w|W]....b'` would find Waheeb, wahe3b (even wahaab)

## Quantifyers
pattern|matches
---|---
+| one or more times (greedily)
?| zero or one time
*| zero or more times (greedily)
{m}| exactly m times
{m,n}| m to n times, not less
{,n}| up to n times
{m,}| m or more times

Note: adding `?` to either of the quantifiers including `?` makes their preference to lazy (ie non-greedy)

## Character Classes and Sets
The `[]` operator will find one instance of any character within the square brackets.

pattern|match
---|---
[0-6]|set of digits (0-6)
[a-z]|set of lowercase alphabet
[A-Z]|set of uppercase alphabet
[a-d]|a,b,c,d only
[^a-d]|all lowercase letters besides a,b,c,d
[a-dk-m]|a,b,c,d,k,l,m only
\w|alphanumeric characters including underscore
\W|non word charater
\d|digits (0-9)
\D|non-digits
\s|spaces as well as `\n, \t, \r`
\S|non white space characters


`[(-+)]` characters become literal inside a set this matches to `(`,`-`,`+`, and `)`
## Anchors and Boundaries
pattern|definition
---|---
^|start of string or after `\n`
$|end of string or until `\n`
\b|word boundary

## Logical Or
`A|B` either A or B

`wo(man|men)` matches either woman or women
`http|s` matches either `http` or `s`, rather `https?`

## Capturing Groups
- used to match a specific subpattern in a pattern
- which can be used for further analysis
- used for organising data

example:
Extracting flight information from an email body containing boarding pass information.
"Here you have your boarding pass LA4214 AER-CDB 06NOV"
```python
# Import re
import re

# Write regex to capture information of the flight
regex = r"([A-Z]{2})(\d{4})\s([A-Z]{3})-([A-Z]{3})\s(\d{2}[A-Z]{3})"

# Find all matches of the flight information
flight_matches = re.findall(regex, flight)

#Print the matches
print("Airline: {} Flight number: {}".format(flight_matches[0][0], flight_matches[0][1]))
print("Departure: {} Destination: {}".format(flight_matches[0][2], flight_matches[0][3]))
print("Date: {}".format(flight_matches[0][4]))
```
returns:
Airline: LA Flight number: 4214
Departure: AER Destination: CBD
Date: 06NOV

### Alternation and Non-capturing groups
__Alternation__<br>
- using paranthesis and pipe operator to group optional characters

Extracting the number of girls or boys using the pipe operator, one would intuitively use `r'\d\sgirls|boys'`
_gotcha:_
`|` compares everything to the left of it with everything to the right of it, ie "<number> girls" OR "boys"
to get the result we want we can use parenthesis to group optional characters: `r'(\d)\s(girls|boys)'` <br>
    which will return a 2-tuple list with the number (\d) and the gender(girls|boys)

__Non-capturing groups__<br>
- used when we want to match but not capture group
- - the group will not be backreferenced
- add `?:` to the group (?:regex_pattern)

__Combining both alteration and non-capturing groups__
If we want to extract the (number) day from a string but not the year, we can combine the alternation trick with the non-capturing group as we are only interested in the number
```python
string = "Today is the 24th of September 2019, the last recorded date was the 23rd of August"
re.findall(r'('\d+)(?:th|rd|st|nd)', string)
```


### Symbolic Group Names
Captured groups are numbered, 0 referring to all groups captured, then incrimentally increasing for each captured group
example:
extract date from string:
```python
string = your next appointment will be on the 13/03/2020
regex_date = r'((\d{2})/(d{2})/(d{4})'
date_detail = re.findall(regex_date, string)
print(date_detail.group(1)
# 03
print(date_detail.group(0)
# 13/03/2020
```
note: `.group()` can only be used in `match` and `search` methods

__named groups__
we can name captured groups and access the group via the name
```python
string = your next appointment will be on the 13/03/2020
date_detail = re.findall(r'(?P<day>\d{2})/(?P<month>d{2})/(?P<year>d{4})', string)
print(date_detail.group(day)
# 13
print(date_detail.group(0)
# 13/03/2020
```
### Backreferences
reference a previously captured group you can use `\1` to refernce first group, for example
`match_tag =  re.match(r"<(\w+)>.*?</\1>", string)` the first group captures the tag inside the <>, then to check if their is a closing tag we backreference the captured group (note the closing tag for html has a preceding `/`)

to reference a named group `(?P<named>.*)` we use `?P=named`

### Lookaround
to confirm if a subpattern is ahead or behind the pain pattern

__look ahead__
using a non capturing group, checks that the first expression is followed by the look ahead expression, if true, returns the first expression
- positive look ahead (true if look ahead pattern found) `(?=regex_pattern)`
- negative look ahead (true if look ahead pattern not found) `(?!regex_pattern)`
```python
log = "copied files: cat.txt successful dog.md successful bird.csv error"
# find successfully coppied files
files_copied = re.findall(r'\w.\w(?=\ssuccessful)', log)
# find not copied
files_not_copied = re.findall(r'\w.w\(?!ssuccessful', log)
```

__look behind__
using a non capturing group, checks that the first expression is preceded by the look behind expression, if true, returns expression after look behind.
- positive look behind (true if look behind pattern found) `(?<=regex_pattern)`
- negative look behind (true if look behind pattern not found) `(?<!regex_pattern)`
```python
family = parent: Annie Aghers kid: Ruby parent: Wahe3b Aghers kid: Lu'lu
parents = re.findall(r'(?<=parent:\s)\w\s\w')
not_kids = re.findall(r'(?<!kid:\s)\w\s\w')
```
## Regex Functions
__findall(pattern, string)__<br>
- takes in a string and returns a list of items matching the pattern
- The  most used regex function (understandably)
example:
find all email adresses

__search(pattern, string)__<br>
- returns a location object of the first match
example:
search for codeword

__sub(pattern, substitute_string, string)__<br>
- similar to 'find and replace' functionality in text editors
- very useful in NLP or to redact data in a documant
example:
redact telephone numbers

__compile(pattern)__
Compile a regular expression pattern into a regular expression object, using re.compile() and saving the resulting regular expression object for reuse is more efficient when the expression will be used several times in a single program.

__split(pattern, string, maxsplit=0)__
Split string by the occurrences of pattern. If capturing parentheses are used in pattern, then the text of all groups in the pattern are also returned as part of the resulting list

## RegEx Compilation Flags
- `re.IGNORECASE`: Match uppercase and lowercase characters interchangeably
- `re.VERBOSE`: Ignore whitespace characters and allow `#` comments

## RegEx Substitution Basics

#### sources
https://www.dataquest.io/blog/regex-cheatsheet/
https://pycon2016.regex.training/cheat-sheet
https://docs.python.org/3/library/re.html
