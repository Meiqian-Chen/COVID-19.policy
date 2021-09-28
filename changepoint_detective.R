library(plus)
library(lars)
library(TSMCP)
library(readr)

prevent=read.csv('data/policy_20days.csv')

prevent=prevent[,-c(1)]
y=as.numeric(prevent[1,37:dim(prevent)[2]])
n=length(y)
plot(as.numeric(prevent[1,37:dim(prevent)[2]]))
x <- sapply(2:n, function(t){cbind(cos(t*pi/20), sin(t*pi/20), 
                                   cos(t*pi/30), sin(t*pi/30), 
                                   y[t-1])},
            simplify = FALSE)
x <- do.call(rbind, x)
tsmcplm(Y = y[-1], X = x, method = "adapt", c =1.6)
abline(v=c(109),col="red")


