# Kernelized Support Vector Machines (SVMs)
### The Kernel Trick
Adding non-linear features to the representation of the data can make linear models much more powerful. But we often which features are unknown and adding many features can be computationally expensive.
The _Kernal Trick_ allows a classifier to train in a higher-dimensional space without computing the new representation. It works by directly computing the distance (the scalar products) of the expanded data points for the expanded feature representation, without actually computing the expansion.

_Polynomial kernal_, computes all possible polynomials up to a certain degree of the original features.<br>
_radial basis function (RBF) kernel_ aka Gaussion kernel, considers all possible polynomials of all degrees but the importance decreases for higher degrees.
## Understanding SVMs
During training the SVM learns the importance of each training data points to represent the decision boundary. The points that lie on the border between the classes are called _support vectors_.

In making a prediction,the new data point and the distance between each of the support vectors are measured. A classification decision is made based on the distances to the support vectors, and the importance of the support vectors.
### Tuning SVM parameters
`gamma` controls the width of the Gaussian kernel.
A low value means the decision boundaries vary slowly, which yields a low complexity model. The higher the value of `gamma`, the more complex the model.

`C` is the regularization parameter similar to linear models, limits the importance of each point (their `dual_coef_`). Increasing `C` allows points to have a stronger influence on the model and makes the decision boundary bend to correctly classify them.

SVMs are very snsitive to parameter settings, and to the scaling of the data. datasets with varying orders of magnitude has devastating effects for kernel SVM.

A common scaling method for kernel SVMs is the `MinMaxScaler` to _preprocess_ the data so that all features are between 0 and 1.
## Strengths, Weakness and Parameters
#### Strengths
- Perform well on a variety of datasets. Allow for complex decision boundaries, even with few features.

- They work well on low and high-dimensional data, but don't scale very well with the number of samples.

#### Weakness
- They become more challenging with datasets of size 100 000 or more, affecting runtime and memory usage.
- SVMs require tuning of the hyperparameters and careful preprocessing of the data.
- SVM models are hard to inspect and not that easy to understand why a particular prediction was made, and difficult to explain the model to non expert.

#### Parameters
- `C` regularization parameters
- choice of kernel (rbf, linear, poly)
- kernel specific parameters (eg`degrees` in poly)
- - RBF kernel has `gamma` which is the inverse width of the Gaussian kernel.
