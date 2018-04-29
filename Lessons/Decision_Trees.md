# Decision Trees
This model learns heiarchical if/else questions, leading to a decision.
Similarly to a game of 20 Questions.
This creates classes using features that are learned from the data.

### Building decision Trees
Learning a decision tree means learning the sequence of if/else Questions
that leads to the true answer the quickest.
These questions are called _tests_.

if data is non-binary (like yes/no features) but rather continous, then the
tests used on continous data are in the form _'is feature i larger than feature a?'_

Building a tree, the algorithm searches over all possible tests and finds one that is most informative about the target variable.
The tree then splits and repeats until the nodes are _pure_ - ie each node contains a single target value (a single class or single regression value)

A prediction on a new data point is made by checking which side of the partition of the feature space the datapoint lies in, then predicting the majority target (or single target in pure leaves) in that region. The region can be found by traversing the tree from the root and going left/right depending on whether the test is fulfilled or not.

In regression tasks, the technique is exactly the same. traverse the tree based on the tests in each node and find the leaf that the new data point falls into. The output for the data point is the mean target of the training points in this leaf.

##### Code implementation
``` python
from sklearn.tree import DecisionTreeClassifier
# random state fixed used for tie breaking
tree = DecisionTreeClassifier(random_state=0)
```
### Controlling Complexity of Decision Trees
Typically, decision trees are buildt continuing till the leaves are  pure, which means the tree is 100% accurate on the training data which means it is overfitting.

There are 2 strategies to prevent overfitting; stopping the creation too early (pre-pruning), or building the tree and then removing nodes that contain little information(post-pruning).

pre-pruning criteria:
1. limiting max depth of the tree
1. limiting max number of leaves
1. requiring a min number of points in a node to keep splitting

> Decision trees in scikit-learn are implemented in the DecisionTreeRegressor and DecisionTreeClassifier classes. scikit-learn only implements pre-pruning, not post-pruning

``` python
tree = DecisionTreeClassifier(max_depth=4, random_state=0)
tree.fit(X_train, y_train)
```
Limiting the depth of a tree can decrese overfitting.

### Visualizing Decision Trees
> might have to install graphviz

``` python
from sklearn.tree import export_graphviz
export_graphviz(model, out_file="filename.dot",
        class_names=['list','of','classes'], feature_names=df.columns[:-1],
        impurity=False,filled=True)
```
to read and visualize the tree
``` python
import graphviz
with open("filename.dot") as f:
  dot_graph = f.read()
graphiz.Source(dot_graph)
```

#### Feature Importance in Trees
`feature_importances_` - rates each importance of each feature between 0 and 1.
The feature importance always sum to 1.
you can visualize the feature importances Similarly to coefficients in a linear model _(like barh)_

A low feature importance doesn't mean that the feature is uninformative, just that it wasn't picked by the model, maybe because another feature encodes the same information.

unlike coefficients in linear models, feature_importances_ are always positive, but don't encode which class a feature is indicative of.

The usage and analysis of Tree Regressions is similar to that of classifiers. One important property of tree regressors are that they are not able to extrapolate, or predict outside the range of training data.

### Strengths, Weakness and Parameters
the pre-pruning parameters are sufficient to prevent overfitting
1. max_depth
1. max_leaf_nodes
1. min_samples_leaf

#### Strengths
1. The model can easiy be visualized and understood
1. no need to scale the data before fitting - do particular well for data of mixed scales, or a mix of binary and continous features.

#### Weakness
if with pre-pruning, they tend to overfit and have poor generalized performance. Therefore ensemble methods are usuallly used.
