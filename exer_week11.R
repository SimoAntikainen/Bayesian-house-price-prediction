


library(ElemStatLearn)
library(glmnet)
library(plotmo)

ridge_galaxy <- glmnet(as.matrix(galaxy[, 1:4]), as.matrix(galaxy[, 5]), alpha = 0)
plot_glmnet(ridge_galaxy, xvar = "lambda", label = TRUE)
#FEature importance
#1. nrth.sth
#2.rdl.pstn
#3 east.wst 
#or
#2.east.wst
#3 rdl.pstn
#4 angle



lasso_galaxy <- glmnet(as.matrix(galaxy[, 1:4]), as.matrix(galaxy[, 5]), alpha = 1)
plot_glmnet(lasso_galaxy, xvar = "lambda", label = TRUE)

#FEature importance
#1. nrth.sth
#2.rdl.pstn
#3 east.wst
#4 angle

#b) 
#Backward
##     X1     X2     X3 
## 0.0010 0.0516 0.0001


##     X1     X3 
## 0.0021 0.0004




#Forward

##     X3 
## 0.0014


##     X1     X3 
## 0.0021 0.0004








