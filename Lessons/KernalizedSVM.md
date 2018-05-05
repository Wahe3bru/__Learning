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

## Strengths, Weakness and Parameters
#### Strengths
#### Weakness
#### Parameters
