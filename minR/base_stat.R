require(reshape2)
head(tips)
GGally::ggpars(tips)
economics
cov(economics$pce, economics$psavert)
cov(economics[, c(2,4:6)])
economics

head(tips)
unique(tips$sex)
unique(tips$day)

t.test(tips$tip, alternative = "two.sided", mu=2.5)
aggregate(tip ~ sex, data = tips, var)
require(ggplot2)
ggplot(tips, aes(x=tip, fill=sex)) +
  geom_histogram(binwidth = .5, alpha = 1/2)

tipsummary <- ddply(tips, "sex", summarise,
                    tip.mean = mean(tip), tip.sd = sd(tip),
                    Lower = tip.mean -2 * tip.sd / sqrt(NROW(tip)),
                    Upper = tip.mean + 2 * tip.sd / sqrt(NROW(tip)))
tipsummary

ggplot(tipsummary, aes(x=tip.mean, y=sex)) + geom_point() +
  geom_errorbar(aes(xmin=Lower, xmax=Upper), height= .2)


tipAnova <- aov(tip ~ day -1, tips)
tipAnova$coefficients
tipIntercept <- aov(tip ~ day, tips)
tipIntercept$coefficients
summary(tipAnova)

require(tidyverse)
require(plyr)
tipsByDay <- ddply(tips, "day", summarise,
                   tip.mean = mean(tip), tip.sd = sd(tip),
                   Length = NROW(tip),
                   tfrac = qt(p=.90, df = Length -1),
                   Lower = tip.mean - tfrac*tip.sd/sqrt(Length),
                   Upper = tip.mean + tfrac*tip.sd/sqrt(Length))
tipsByDay
