# LinearModel Function
Developed a better linear model function written in R that performs linear regression analysis. It takes a response variable Y and one or more predictor variables Xk's as inputs and returns a list of results related to the linear regression model.

## Function Description
The LinearModel function performs the following steps:

1. Calculate the length of the response variable Y and create a vector of ones vls of the same length.
2. Combine the vector of ones with the predictor variables Xk using the cbind function to create the design matrix X.
3. Perform singular value decomposition (SVD) on the transpose of X multiplied by X using the svd function. The SVD decomposition results in three matrices: U, D, and V.
4. Calculate the estimated coefficients betahat using the SVD decomposition matrices U, D, and V.
5. Calculate the hat matrix H, which is used to compute leverage values lv.
6. Calculate the kappa value, which is the square root of the ratio between the largest and smallest singular values.
7. Calculate the predicted values Yhat by multiplying X with betahat.
8. Calculate the residuals resid by subtracting Yhat from Y.
9. Compute the sum of squared errors (SSE) by summing the squared residuals.
10. Determine the number of predictor variables p based on the dimensions of Xk.
11. Calculate the total sum of squares (SST), model sum of squares (SSM), total mean square (MST), error mean square (MSE), and model mean square (MSM) for the regression model.
12. Calculate the standardized residuals sresid by dividing the residuals by the product of the square root of MSE and the square root of 1 - lv.
13. Compute the standard errors of the estimated coefficients SEbetahat using the SVD decomposition matrices.
14. Calculate the coefficient of determination r2 and the adjusted coefficient of determination r2adj.
15. Calculate the F-statistic Fstat and its associated p-value pval.
16. Store the results in a list named results.
17. Return the results list.

## Function Inputs
The LinearModel function takes two input parameters:

- Y: The response variable vector.
- Xkth: The predictor variable matrix.

## Function Outputs
The LinearModel function returns a list named results containing the following elements:

- "pre": The predicted values of the response variable
- "res": The residuals
- "sres": The standardized residuals
- "k": The kappa value
- "lev": The leverage values
- "sse": The sum of squared errors
- "ssm": The model sum of squares
- "mse": The mean square error
- "msm": The model mean square
- "pval": The p-value associated with the F-statistic
- "bhat": The estimated coefficients
- "sebhat": The standard errors of the estimated coefficients
- "r2": The coefficient of determination
- "r2adj": The adjusted coefficient of determination

