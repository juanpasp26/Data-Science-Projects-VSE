library(Histdata)
data("ChickWeight")
head(ChickWeight)
summary(ChickWeight)
#There  was 4 different diets 
#There participate 578 chickens I see it in data environment 
#diet 1 :220 diet 2:120,diet 3 :120, diet 4:118
day0 = ChickWeight[ChickWeight$Time==0,]
day21 = ChickWeight[ChickWeight$Time == 21, c("Chick","weight")]
chicks = merge(x = day0, y = day21, by = "Chick")
gains = chicks$weight.y - chicks$weight.x
chicks$gains = gains
head(chicks)
#chicken’s weight gain in 21 days can be directly read from the gains column, together with the diet it followed.
#subtracting the weight at day 0 from the weight at day 21 for each chicken.
