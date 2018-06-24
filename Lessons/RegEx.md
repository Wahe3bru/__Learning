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

## Logical Or and Capture Groups
`A|B` either A or B

`wo(man|men)` mathes either woman or women
`http|s` matches either `http` or `s`, rather `https?`

## Symbolic Group Names

## RegEx Compilation Flags


## RegEx Substitution Basics

#### sources
https://www.dataquest.io/blog/regex-cheatsheet/
https://pycon2016.regex.training/cheat-sheet
https://docs.python.org/3/library/re.html
