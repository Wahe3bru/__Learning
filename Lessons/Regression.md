https://www.analyticsvidhya.com/blog/2017/06/a-comprehensive-guide-for-linear-ridge-and-lasso-regression/

https://www.analyticsvidhya.com/blog/2016/07/deeper-regression-analysis-assumptions-plots-solutions/

https://www.analyticsvidhya.com/blog/2015/08/comprehensive-guide-regression/

#### Notes:
SSE is highly sensitive to number of data points

R² measures, “How much the change in output variable (y) is explained by the change in input variable(x).

One disadvantage of R-squared is that it can only increase as predictors are added to the regression model. This increase is artificial when predictors are not actually improving the model’s fit. To cure this, we use “Adjusted R-squared”.

Adjusted R-squared should always be used with models with more than one predictor variable. It is interpreted as the proportion of total variance that is explained by the model

Things get much more complicated when your multiple independent variables are related to with each other. This phenomenon is known as Multicollinearity. This is undesirable.  To avoid such situation, it is advisable to look for Variance Inflation Factor (VIF). For no multicollinearity, VIF should be ( VIF < 2). In case of high VIF, look for correlation table to find highly correlated variables and drop one of correlated ones.

Along with multi-collinearity, regression suffers from Autocorrelation, Heteroskedasticity.

The presence of non-constant variance in the error terms results in heteroskedasticity

easily check this by looking at residual vs fitted values plot. If heteroskedasticity exists, the plot would exhibit a funnel shape pattern (detailed understanding of assumptions and interpretation of regression plots)[https://www.analyticsvidhya.com/blog/2016/07/deeper-regression-analysis-assumptions-plots-solutions/]

 over-fitting. We also say that the model has high variance and low

underfitting, it occurs when our model neither fits the training data nor generalizes on the new data.
model is underfit when we have high bias and low variance.

 To overcome underfitting or high bias, we can basically add new parameters to our model so that the model complexity increases, and thus reducing high bias.

 two methods to overcome overfitting,
- Reduce the model complexity
- Regularization
