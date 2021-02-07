require(survival)
head(bladder)

bladder[100:105,]
survObject <- with(bladder[100:105,], Surv(stop, event))
survObject
survObject[,1:2]
