# Regular Expression

## Basic RegEx
pattern|match
---|---
.|any Character besides newline (\n)
`\.`| fullstop
a|only `a`
`\\`| \
`\*`|* character

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

Note: adding `?` to either of the quantifiers including `?` makes their preference to less (ie non-greedy)

## Character Classes and Sets
pattern|match
---|---
[0-6]|set of digits (0-6)
[a-z]|set of lowercase alphabet
[A-Z]|set of uppercase alphabet
[a-d]|a,b,c,d only
[^a-d]|all lowercase letters besides a,b,c,d
[a-dk-m]|a,b,c,d,k,l,m only
 |
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

example: Extracting flight information from an email body containing boarding pass information.
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
### Alternation and Non-capturing groups

### Backreferences

### Lookaround

## Symbolic Group Names

## RegEx Compilation Flags


## RegEx Substitution Basics

#### sources
https://www.dataquest.io/blog/regex-cheatsheet/
https://pycon2016.regex.training/cheat-sheet
https://docs.python.org/3/library/re.html
