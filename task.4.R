install.packages("HistData")
library(HistData)
data("GaltonFamilies")
?GaltonFamilies
summary(GaltonFamilies)
#934 children participate on the study  we can notice in the enviroment table
unique(GaltonFamilies$family)#205 families participate on the study
table(GaltonFamilies$father>GaltonFamilies$mother)
GaltonFamilies[,1:3]
lahice=unique(GaltonFamilies[,1:3])
summary(lahice)
mean(lahice$father)-mean(lahice$mother)
#We noticed that fathers are generally taller than mothers.
#On average, the height difference between them is 5.31 cm.
#The shorter individuals show only a small difference, but among the taller ones, the difference reaches almost 8 cm.
table(lahice$father>lahice$mother)
percent=table(lahice$father>lahice$mother)
percent/sum(percent)*100
#There are 188 families where the mother is shorter than the father.
#In total, 91.7% of families have a taller father, while only 8.29% have a taller mother.
#This supports what Galton described as assortative mating.
