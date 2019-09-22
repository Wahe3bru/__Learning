
## Types of Missing Data
Missing data occurs when there is no value stored for certain variable in an observation.
Data can be missing for a multitude of reasons.
- the value was forgotten/lost/not stored properly
- in a survey the question might not have been asked
- for a specific observation, the value might not exist
- the value is unknown

### Missing Data Mechanisms
There are 3 mechanisms that lead to missing data, 2 of them involve missing data randomly or almost-randomly, and the third one involves a systematic loss of data.

#### Missing At Random
When there is a relationship between the observed data and the propensity of missing data. The probability of data missing is dependant on other variables. 
eg. Fitter people are more likely to disclose their weight than unfit people. Therefore there will be weight information missing at random for individuals who do not disclose their weight, but because the unfit are less likely to disclose their weight, there will be more missing weight information than the fit individuals. If the weight information is to be used, we can control for the bias by adding a fitness indicator.

#### Missing Not At Random
There is a mechanism or reason why missing values are introduced in the dataset. For example a study that advertises at a university campus will have many missing age groups as the volunteers would be of very similar ages.

#### Missing Completely At Random
The probability of a variable missing is the same for all the observations. There is no relationship between the data missing and other values, observed or missing, within the dataset. There is nothing systematic going on that makes it more likely that some data to be missing more than other data. Therefore if we disregard the observations where data is missing completely at random, we __do not bias the inferences__ made. 

Understanding the reason for which data is missing is important in deciding which methods to impute (or disregard) the missing values.

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

---

#### Methods of handling Missing data
- Complete Case Analysis or "list-wise deletion"
- mean/median imputaion
- Arbitary value imputation
- End distribution imputation
- Frequent category imputation
- Missing category imputation
- Random sample imputation
- Missing indicator
