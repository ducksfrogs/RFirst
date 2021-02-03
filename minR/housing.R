housing <- read.table("http://www.jaredlander.com/data/housing.csv", sep=',', 
                      header = TRUE, stringsAsFactors = FALSE)

head(housing)

names(housing) <- c("Neiborhood", "Class", "Units", "YearBuilt", "SqFt", "Income", 
                   "IncomeperSqFt","Expence", "ExpencePerSqFt","NetIncome", "Value",
                   "ValueperSqFt", "Boro")
ggplot(housing, aes(x = ValueperSqFt)) + 
  geom_histogram(binwidth = 10) +labs(x = "Value per Square Foot")

ggplot(housing, aes(x = ValueperSqFt, fill=Boro)) + 
  geom_histogram(binwidth = 10) +labs(x = "Value per Square Foot")
ggplot(housing, aes(x= ValueperSqFt, fill=Boro))+
  geom_histogram(binwidth = 10) + labs(x = "Value per Square Foot") +
  facet_wrap(~Boro)

ggplot(housing, aes(x=SqFt)) + geom_histogram()
ggplot(housing, aes(x=Units)) + geom_histogram()
gg