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
__Note:__ There are many ways to target a specific tag, and some might be easier than others. It is best to make your selections as specific as possible so that your code wont break when minor changes are made to the website. To make scrapers more robust, making it as specific as possible by taking advantage of tag attributes whenever possible.
##### children and descendants
_children_ are exactly one tag below a parent, whereas descendants can be any level below the parent.
BeautifulSoup functions will always deal with descendants of the selected tag.
eg. `bs4.div.findall("img)` finds the first `div` tag, then retrieves all the `img` tags that are descendants of that `div`. To only retrieve the children - use the `.children` tag
`bs4.div.findall("img)`
##### siblings
Note if you get siblings of an object, the object itself will not be included.
`.next_siblings` returns all the same tags on that level, excluding the original tag. This makes it easy to scrape data from tables. 
eg `bsObj.find("table",{"id":"giftList"}).tr.next_siblings` will return a list of each row in the table, but because `.next_siblings` was called on the title row, the first was omitted (as it can't be siblings with itself).
Similarly `.previous_siblings` can be helpful if the easily selectable tag is the last tag of its siblings.
`next_sibling` and `previous_sibling` returns a single tag.
##### parents
`.parents` and `.parent` are the functions for finding parent/s of a tag.
Most approaches tackle scraping the website from the top down, but sometimes it might be easier to target a tag and getting the parent would help in retrieving the relevant data.<br>

The example in the book shows targeting the image (1), then selecting the `parent` (2), selecting the `previous_sibling` (3), and finally extracting the `text` within that tag "$15.00"
```html
<tr>
  <td>
  <td>
  <td>(3)
    “$15.00” (4)
  s<td> (2)
    <img src=”../img/gifts/img1.jpg">(1)
```
---

  ### Regular Expressions
