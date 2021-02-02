require(plyr)
head(baseball)
baseball$sf[baseball$year < 1954] <- 0

any(is.na(baseball$hbp))
baseball$hbp[is.na(baseball$hbp)] <- 0

baseball <- baseball[baseball$ab >=50, ]

baseball$OBP <- with(baseball, (h + bb +hbp)/(ab + bb + hbp + sf))
baseball$OBP
obp <- function(data){
  c(OBP = with(data, sum(h + bb + hbp)/sum(ab + bb + hbp + sf)))
}
carrerOBP <- ddply(baseball, .variables = "id", .fun = obp)
carrerOBP <- carrerOBP[order(carrerOBP$OBP, decreasing = TRUE), ]
head(carrerOBP, 10)

lapply(theList, sum)
llply(theList, sum)
sapply(theList, sum)
laply(theList, sum)

require(ggplot2)
data("diamonds")
aggregate(price ~ cut, diamonds, each(mean, median))
