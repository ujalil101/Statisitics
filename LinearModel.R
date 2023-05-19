LinearModel <- function (Y, Xk) {
  n <- length(Y)
  vls <- rep(1,n)
  X <- cbind(vls,Xk)
  
  S <- svd(t(X)%*%X)
  U <- S$u
  D <- diag(S$d)
  V <- S$v
  
  betahat <- V%*%solve(D)%*%t(U)%*%t(X)%*%Y
  H <- X%*%V%*%solve(D)%*%t(U)%*%t(X)
  lv <- diag(H)
  kappa <- sqrt(abs(max(S$d)/min(S$d)))
  
  Yhat <- X%*%betahat
  resid <- Y-Yhat
  SSE <- sum(resid^2)
  
  if (is.null(dim(Xk)[2])) {
    p = 1
  }
  else {
    p = dim(Xk)[2]
  }
  
  SST <- sd(Y)^2*(n-1)
  SSM <- SST - SSE
  MST <- SST/ (n-1)
  MSE <- SSE/ (n-p-1)
  MSM <- SSM / p
  
  sresid <- resid/(sqrt(MSE)*sqrt(1-lv))
  SEbetahat <- sqrt(MSE) * sqrt(diag(V%*%solve(D)%*%t(U)))
  r2 <- 1 - (SSE/SST)
  r2adj <- 1 - (MSE/MST)
  
  Fstat <- MSM/MSE
  pval <- pf(Fstat, p, n-p-1, lower.tail = F)
  
  results <- list("pre" = Yhat,
                  "res" = resid,
                  "sres" = sresid,
                  "k" = kappa,
                  "lev" = lv,
                  "sse" = SSE,
                  "ssm" = SSM,
                  "mse" = MSE,
                  "msm" = MSM,
                  "pval" = pval,
                  "bhat" = betahat,
                  "sebhat" = SEbetahat,
                  "r2" = r2,
                  "r2adj" = r2adj)
  return (results)
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  