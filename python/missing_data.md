
## Types of Missing Data
#### Missing At Random

#### Missing Not At Random

#### Missing Completely At Random

---

##### Pandas NA handling methods
|Method|Description|
|-|-|
|dropna|filter axis with missing data. thresholds for missing data to tolerate
|fillna|fill in missing data with a value, or an interpolation method such as 'ffill' or 'bfill'
|isnull|return boolean values indicating missing/NA values
|notnull|oppossite of `isnull`

### Filtering Out Missing Data
with Series, it's simpler to use `dropna` than using boolean indexing with `isnull`
```python
import numpy as np
import pandas as pd

data = pd.Series([1, 5, np.nan, 3, np.nan,9])

data.dropna()
#is eqivalent to
data[data.notnull()]
```

with DataFrames, you have the option to drop rows or columns based on if they contain _any or all NAs_. The default is dropping rows containing any NAs.

to drop rows only if they are all NA:
`df.dropna(how='all')`

to drop collumns instead:
`df.dropna(axis=1)`

keeping only those rows below a threshold:
`df.dropna(thresh=0.3)`

The problem with filtering out rows or columns with NAs is that you lose a lot of data.

### Filling in Missing Data

the workhorse function `fillna`
##### `fillna` function arguments
|Agrument|Description|
|-|-
|value| Scalar value or dict object to use to fill missinf values|
|method| Interpolation, 'ffilll' by default if function called with no arguments|
|axis|default rows (`axis=0`)|
|inplace|modify object without producing a copy|
|limit|max number of consecutive periods to fill, used for forward or backfilling

Calling `fillna` with a constant replaces missing values with that value:
`df.fillna(0)`

to fill missing values of different columns call `fillna` with a dict:
`df.fillna({'col1': 0, 'col2': 0.5, 'col5': 999})`

interpolation methods like _forward fill_ can also be used:
`df.fillna(method='ffill')`
adding a limit to how far to fill:
`df.fillna(method='bfill', limit=3)`

#### Methods of filling Missing data
- filling with a constant
- filling with mean/median
- interpolation
- adding a missing data (boolean) column
