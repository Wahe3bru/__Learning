# k-Nearest Neighbors
one of the simplest ml algorithm. Building the model consists only of storing
the training datasets [?](check back)
To predict new data point, the algorithm finds the closest data points in the training datasets - _it's nearest neighbours_
## k-Neighbors classification
in it's simplest form `(k=1)` the algorithm only considers it's nearest neighbour. The prediction is then the known output for this training point (neighbour).

if we increase (k) the neighbours `k=3`, the new data point would take in the nearest k-neighbours and vote, with the majority count choosing the class.

#### Code Implementation

``` python
from sklearn.neighbours import KNeighboursClassifier
clf = KNeighboursClassifier(n_neighbours=3)

clf.fit(X_train, y_train

print('Test set predictions: {}'.format(clf.predict(X_test)))

print('Test accuracy: {:.2f}'.format(clf.score(X_test, y_test)))
```

### Analyzing KNeighboursClassifier
#### model complexity vs generalization

``` python
from sklearn.datasets import load_breast_cancer
    cancer = load_breast_cancer()
    X_train, X_test, y_train, y_test = train_test_split(
        cancer.data, cancer.target, stratify=cancer.target, random_state=66)
training_accuracy = [] test_accuracy = []
# try n_neighbors from 1 to 10 neighbors_settings = range(1, 11)
for n_neighbors in neighbors_settings:
# build the model
clf = KNeighborsClassifier(n_neighbors=n_neighbors) clf.fit(X_train, y_train)
# record training set accuracy training_accuracy.append(clf.score(X_train, y_train)) # record generalization accuracy test_accuracy.append(clf.score(X_test, y_test))
    plt.plot(neighbors_settings, training_accuracy, label="training accuracy")
    plt.plot(neighbors_settings, test_accuracy, label="test accuracy")
    plt.ylabel("Accuracy")
    plt.xlabel("n_neighbors")
    plt.legend()
```

> insert above plot here

`k=1` overfits the data and increasing kneighbours leads to a more generalised model that is less complex but has a better test Accuracy.

### k-Neighbours Regression
The prediction uses the mean of the relevant neighbours.

``` python
from sklearn.neighbors import KNeighborsRegressor
```

## Strengths, Weakness and Parameters
#### Parameters
1. The number of neighbours, default=1
1. How the distance between data points is measured, by default Euclidean distance is used

#### Strengths
- easy to understand and gives good performance with out alot of adjustments (`k = 3` or `5` is good)
- use as a good baseline before carrying out more advanced models
- building a model is fast

#### Weakness
- building a model is fast but in large datasets prediction is slow
- doesn't perform well on datasets with many features (100+features)
- does very bad on _sparse datasets_ - datasets where most features are 0 most of the time.
