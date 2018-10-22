String formatting and manipulation
df.poem = df.poem.apply(lambda x: x.lower())
df.poem = df.poem.apply(lambda x: x.translate(None, string.punctuation))
df.poem = df.poem.apply(lambda x: x.translate(None, string.digits))







https://jakevdp.github.io/WhirlwindTourOfPython/14-strings-and-regular-expressions.html
