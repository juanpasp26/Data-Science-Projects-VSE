math=read.csv("/Users/juansandoval/Downloads/pisa_math.csv")
read=read.csv("/Users/juansandoval/Downloads/pisa_reading.csv")
#1.1
summary(math)
summary(read)
#1.2
length(na.omit(math$Math03))
length(na.omit(read$Reading03))
#1.3

length(na.omit(math$Math22))
length(na.omit(read$Reading22))

#2.1
df=merge(x=math,y=read, by="Country")
df22=na.omit(df[,c("Country","Math22","Reading22")])
summary(df22)
plot(x=df22$Math22,y=df22$Reading22)
df22[df22$Reading22==max(df22$Reading22),]
#2.2
cor(df22$Math22,df22$Reading22)
#2.3
df22$absDiff = abs(df22$Math22-df22$Reading22)
df22[order(df22$absDiff,decreasing=TRUE),]
#2.4
df22$average=(df22$Math22+df22$Reading22)/2
df22[order(df22$average,decreasing = TRUE),]

