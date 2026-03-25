a13=read.csv("/Users/juansandoval/Downloads/A22_2023/A22_2013.csv")
a23=read.csv("/Users/juansandoval/Downloads/A22_2023/A22_2023.csv")
a13$frequency=as.numeric(a13$frequency)
a13$salary=as.numeric(a13$salary)
a23$frequency=as.numeric(a23$frequency)
a23$salary=as.numeric(a23$salary)
a13=na.omit(a13)
a23=na.omit(a23)
total_number_workers13=sum(a13$frequency)
total_amountpaid13=sum(a13$frequency*a13$salary)
total_number_workers23=sum(a23$frequency)
total_amountpaid23=sum(a23$frequency*a23$salary)
averagepay13=total_amountpaid13/total_number_workers13
averagepay23=total_amountpaid23/total_number_workers23

hist(a13$salary,
     main = "salary distribution 2013",
     xlab = "salary",
     col = "lightblue",
     border = "black")

abline(v = averagepay13, col = "red", lwd = 2, lty = 2)

hist(a23$salary,
     main = "salary distribution 2023",
     xlab = "salary",
     col = "lightgreen",
     border = "black")

abline(v = averagepay13, col = "red", lwd = 2, lty = 2)