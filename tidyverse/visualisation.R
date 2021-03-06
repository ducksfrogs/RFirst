bar <- ggplot(data=diamonds) +
  geom_bar(
    mapping = aes(x=cut, fill=cut),
    show.legend = FALSE,
    with = 1
  ) +
  theme(aspect.ratio = 1)+
  labs(x=NULL, y=NULL)
bar + coord_flip()
bar + coord_polar()

ggplot(data = diamonds)+
  geom_bar(
    mapping = aes(x=cut, fill=cut)
  )
