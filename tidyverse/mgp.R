mpg
require(ggplot2)
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y = hwy, alpha=class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy)) +
  facet_wrap(~class, nrow = 2)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x=cut))

summary(diamonds)
library(tidyverse)

filter(mpg, cyl==8)
filter(diamonds, carat >3)
