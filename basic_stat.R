library(ggplot2)
head(economics)
cor(economics$pce, economics$psavert)
xPart <- economics$pce - mean(economics$pce)
yPart <- economics$psavert - mean(economics$psavert)
nMinousOne <- (nrow(economics) -1)
xSd <- sd(economics$pce)
ySd <- sd(economics$psavert)

sum(xPart*yPart) / (nMinousOne * xSd* ySd)
cor(economics[, c(2,4:6)])
GGally::ggpairs
install.packages("GGally")

library(GGally)
GGally::ggpairs(economics, economics[, c(2, 4:6)], parm = list(labelSize=8))

require(reshape2)
require(scales)
econCor <- cor(economics[, c(2,4:6)])
econMelt <- melt(econCor, varnames = c("X", "Y"), value.name = 'Correlation')
econMelt <- econMelt[order(econMelt$Correlation),]
econMelt
