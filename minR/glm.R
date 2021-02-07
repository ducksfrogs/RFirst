acs <- read.table("http://www.jaredlander.com/data/acs_ny.csv", sep=',', 
                      header = TRUE, stringsAsFactors = FALSE)

acs$income <- with(acs, FamilyIncome >= 150000)
acs$income
require(ggplot2)
ggplot(acs, aes(x=FamilyIncome)) +
  geom_density(fill="grey", color="grey") +
  geom_vline(xintercept = 150000)
head(acs)
income1 <- glm(income ~ HouseCosts + NumWorkers + OwnRent + NumBedrooms + FamilyType,
               data = acs, family = binomial(link = 'logit'))
summary(income1)

require(coefplot)
coefplot(income1)

invlogit(income1$coefficients)

#Pois

ggplot(acs, aes(x= NumChildren)) + geom_histogram(binwidth = 1)

children1 <- glm(NumChildren ~ FamilyIncome + FamilyType + OwnRent, data = acs, family = poisson(lin='log'))
summary(children1)

coefplot(children1)

Z <- (acs$NumChildren - children1$fitted.values) / sqrt(children1$fitted.values)
sum(Z^2)/children1$df.residual
pchisq(sum(Z^2), children1$df.residual)
chidren2 <- glm(NumChildren ~ FamilyIncome + FamilyType + OwnRent, data = acs, family = quasipoisson((lin="log")))
multiplot(children1, chidren2)
