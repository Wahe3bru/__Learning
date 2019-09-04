webscraping with python, 2nd edition by Ryan Mitchell (o'Reilly)

```python
from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen('http://www.pythonscraping.com/pages/page1.html')
bs = BeautifulSoup(html.read(), 'html.parser')

nameList = bs.findAll('span', {'class':'green'}) for name in nameList:
    print(name.get_text())
```
_note:_
`.get_text()` strips all the html tags and returns a string block. Therefore it's
advisable for it to be used last - to extract the data.

### The most common bs4 functions: find() and find_all()

`bs.find_all(tag, attributes, recursive, text, limit, keywords)`<br>
`bs.find(tag, attributes, recursive, text, keywords)`<br>
- `tag` string name of (html) tag or list of string names <br>
   `bs.find_all(['h2', 'h3'])`
- `attributes` dictionary of attributes and matches tags that contain any
   `bs.find_all('span', {'class': {'narrator', 'audience'}})`
- `recursive` default True, will search children and children's children for tags
- `text` matches on the _text content_ of the tags rather than the property
- `limit` only in `find_all` and if set to 1 is equivalent to `find()`. returns the first n items of the page
- `keywords` select tags that contain a particular attribute or set of attributes.<br>
   `title = bs.find(id='title')` or `quotes = bs.find_all(class_='quote')`

#### Navigating HTML trees
##### children and descendants

##### siblings

##### parents

---

  ### Regular Expressions
