theMatrix <- matrix(1:9, nrow = 3)
apply(theMatrix, 1, sum)
apply(theMatrix, 2, sum)
rowSums(theMatrix)
theList <- list(A=matrix(1:9, nrow = 3, ncol = 3), B=1:5, C = matrix(1:4, 2), D =2)
lapply(theList, sum)

sapply(theList, sum)

theNames <- list("Jared", "Deb", "Paul")
sapply(theNames, nchar)
lapply(theNames, nchar)

firstList <- list(A= matrix(1:16, 4), B= matrix(1:16,2), c=1:5)
secondList <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), c=15:1)
mapply(identical, firstList, secondList)

simpleFunc <- function(x, y){
  NROW(x)+ NROW(y)
}
mapply(simpleFunc, firstList, secondList)

#aggregate part

require(ggplot2)
data("diamonds")
head(diamonds)

aggregate(price ~ cut, diamonds, mean)

aggregate(price ~ cut + color, diamonds, mean)
