require(UsingR)
t.test(father.son$fheight, father.son$sheight, paired = TRUE)
head(father.son)

t.test(tips$tip, alternative = 'two.sided', mu=2.5)

titTtest <-t.test(tips$tip, alternative = 'two.sided', mu=2.5)
randT <- rt(3000, df=NROW(tips)-1)
ggplot(data.frame(x=randT))+
  geom_density(aes(x=x), fill="grey", color='grey')+
  geom_vline(xintercept = titTtest$statistic)+
  geom_vline(xintercept = mean(randT) + c(-2,2)*sd(randT), linetype=2)
