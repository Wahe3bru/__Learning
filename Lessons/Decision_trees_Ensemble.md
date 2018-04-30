# Ensemble of Decision Trees

_Ensembles_ are methods that combine multiple ML models to create more powerful models.

## Random Forests
addresses the problem of overfitting in Decision Trees.
A collection of Decision Trees, but each tree is slightly different from another. So if we build many trees that work well and overfit the data in different ways, the amount of overfitting can be reduced if average out the results.

There are two ways to randomise trees in a forest:
1. by selecting the data points used to build a tree
1. by selecting the features in each split test

### Building Random Forests
`n_estimators` - the number of trees to build.

To build a tree we first take a _bootstrap sample_ of the data. That is from `n_samples` data points we take repeatedly and with replacement `n_samples` times. This will create a dataset as big as the original, but some data points will be missing (about a third) and some will be repeated.

Then a tree is build on newly created dataset. Each node in the algorithm randomly selects subset of features and looks for the best possible test. The selection of features is repeated separately for each, therefore each node in a tree makes a decision using a different subset of features.

The bootstrap sampling leads to each tree in the forest being built on slightly different dataset. The selection of features in each nodes ensures that each split in each tree operates on a different subset of features. Together, these mechanisms ensure that all trees in the random forest are unique.

A critical parameter in the above process is `max_features`. A high `max_features` means the trees will be quite similar, being able to easily fit the data using the most distinctive features. A low `max_features` limits the chioce of features to split and therefore ensures that trees will be quite different, but each tree might need to be very deep to fit the data.

##### Prediction in Random Forest
The algorithm first makes a prediction on every tree in the forest.

For _regression_ we average the results to get our final prediction.

for _classification_ a 'soft voting' strategy is used. Each tree provides a "soft" prediction providing a probability of each possible output label. The probabilities are averaged and the class with the highest probability is predicted.

#### Code implementation
``` python
from sklearn.ensemble import RandomForrestClassifier

forest = RandomForrestClassifier(n_estimators=5, random_state=2)
forest.fit(X_train, y_train)

print("Accuracy on training set: {:.3f}".format(forest.score(X_train, y_train)))
print("Accuracy on test set: {:.3f}".format(forest.score(X_test, y_test)))

```
### Strengths, Weakness and Parameters

##### Strengths
- Widely used machine learning methods, both classification and regression
- Very powerful and work well without heavy tuning of parameters.
- Don't require scaling of the data
- `n_jobs` parameter allows parallel processing
- for reproducable results important to fix `random_state`
- works well on large datasets (with parallel processing)

##### Weakness
- Doesn't perform well on high dimensional and sparse data such as text
- require more memory and slower to train than linear models

##### Parameters
- `n_estimators` - number of trees; larger is always better
- `max_features` - determines how different each tree is, reduces overfitting and default parameters good enough.
- `max_features` and `max_leaf_nodes` can sometimes improve performance. Sometimes drastically reducing space and time requirements for training and prediction

---
## Gradient Boosted Regression Trees (Gradiend Boosting Machines)
used for both classification and regression.
Works by building trees serially, where each tree corrects the mistakes of the previous. By default, no randomisation, instead strong pre-pruning is used. Using very shallow trees, of depth 1 to 5, making the model smaller in memory and predictions faster.

Main idea is to combine many simple  models (weak learners) like shallow trees. Each tree provide good predictions on part of the data, so more are added to iteratively improve performance.

`learning_rate` important parameter which controls how strongly tries to correct the the mistakes of the previous. A higher learning increases models complexity similarly, adding more trees to the ensemble.

#### Code implementation
``` python
from sklearn.ensemble import GradientBoostingClassifier

gbrt = GradientBoostingClassifier(random_state=0)
gbrt.fit(X_train, y_train)

print("Accuracy on training set: {:.3f}".format(gbrt.score(X_train, y_train)))
print("Accuracy on test set: {:.3f}".format(gbrt.score(X_test, y_test)))
```
By default `n_estimators = 100`, `max_depth=3` and `learning_rate = 0.1`

Reducing `max_depth` and/or `learning_rate` would reduce complexity and generalise performance.

### Strengths, Weakness and Parameters
A common practice is to fit `n_estimators` depending on time and memory budget, and then search over different learning rates.
##### Strengths
- most powerful and widely used models for supervised learning.
- no need for scaling data
- works well on a mixture of binary and  continuous features.

##### Weakness
- require careful parameter tuning
- may take along time to train
- Doesn't work well on high dimensional sparse data

##### Parameters
- `n_estimators` - number of trees
- `learning_rate` - degree to which each tree is allowed to correct the mistakes of the previous
These 2 main parameters are interconnected as a lower learning_rate requires more trees needed to build a model of similar complexity. note that more trees leads to overfitting.
- `max_depth` or alternatively `max_leaf_nodes` - reduces complexity of each tree. `max_depth` usually set very low, often not deeper than 5 splits
