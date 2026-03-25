library(carData)
data("Davis")
?Davis
head(Davis)
summary(Davis)
Davis=na.omit(Davis)
plot(Davis$weight,Davis$height)
Davis[Davis$height<100,]
Davis[Davis$weight>110,]
Davis=Davis[-12,]
weightdifference=Davis$repwt-Davis$weight
Davis$weightdifference=Davis$repwt-Davis$weight
mean(weightdifference[Davis$sex=="M"])
mean(weightdifference[Davis$sex=="F"])
hist(Davis$weightdifference,
     col = "brown",
     main="Difference reported- mesured weight",
     xlab="weight difference mesured in kg")
boxplot(weightdifference~sex,data = Davis,
     col = c("blue","pink"),
     main="Difference weight reported by sex",
     ylab ="weight difference mesured in kg", 
     xlab="sex")
#we notice female lies more about their weight by difference from 0
#males reported more weight that they are actually are while womman reported less weight 