library(carData)
data("Davis")
head(Davis)
?Davis
summary(Davis)
#1. the error is that there are some missing data, in reported weight and height, also corrected 12 row 
Davis[12,"height"]=157
Davis[12,"repwt"]=156
na.omit(Davis)
Davis=na.omit(Davis)
table(Davis$height)
range(Davis$height)
max(Davis$height)-min(Davis$height)
#2. range of height is 49
summary(Davis[Davis$sex=="M", ])
summary(Davis[Davis$sex=="F", ])
#3.males on average are taller 13.9 com,yes it depends on sex because we evidence on summary that male are taller with greater min and max
summary(Davis$weight)
summary(Davis$repwt)
#the avarage reported weight is lower than averge weight 0.62 kg
Davis$difference=Davis$weight-Davis$repwt
Davis$difference==0
table(Davis$difference==0)
sum(Davis$difference==0)
Davis$lied=Davis$difference==0
table(Davis$sex, Davis$lied)
#males lie more than females on their weight 
?cor
cor(Davis$weight,Davis$height)
#0.61 means there is a moderately strong positive relationship between height and weight.from 0 to 1 