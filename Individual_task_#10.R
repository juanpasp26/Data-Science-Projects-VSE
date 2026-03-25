library(RMySQL)

connect=dbConnect(MySQL(),
                  user="user_4st604",
                  password="pass_4st604",
                  dbname="db_4st604",
                  host="db4free.net",
                  port=3306)


#1.The highest average ratings appear in the 1930s, followed by the 1940s.
#This means older classic movies tend to receive slightly higher ratings than modern ones.
dbListTables(connect)
mr=dbGetQuery(connect, "SELECT * FROM movies_ratings;")
mi=dbGetQuery(connect, "SELECT * FROM movies_info;")


df=merge(x=mi, y=mr, by="movieId")
df=merge(x=mi, y=mr, by="movieId",all.y = TRUE)
df$title
df[is.na(df$title),c("movieId","title","release_year","rating")]
unique(df$movieId[is.na(df$title)])

df=merge(x=mi, y=mr, by="movieId")
df=df[,c("movieId","userId","release_year","rating","title")]


sort(unique(df$release_year))
df$decade = floor((df$release_year)/10)*10
unique(df[,c("release_year","decade")])
head(df)


length(unique(df$decade))
mean(df$rating[df$decade==1910])
mean(df$rating[df$decade==1920])
mean(df$rating[df$decade==1930])
mean(df$rating[df$decade==1940])
mean(df$rating[df$decade==1950])
mean(df$rating[df$decade==1960])
mean(df$rating[df$decade==1970])
mean(df$rating[df$decade==1980])
mean(df$rating[df$decade==1990])
mean(df$rating[df$decade==2000])
mean(df$rating[df$decade==2010])
?aggregate 
aggregate(df,rating~decade,mean)
df[df$decade==1920,]

#
# 2 Are dramas or comedies rated higher?
#Dramas are rated higher on average than comedies
#This suggests that audiences tend to give more favorable ratings to serious or emotional films compared to light-hearted ones.
df2=merge(x=mi, y=mr, by="movieId")

dramas=df2[df2$Drama==1,]
comedies=df2[df2$Comedy==1,]
sum(df2$Comedy==1 & df2$Drama==1) 
summary(dramas$rating)
summary(comedies$rating)


#3There is a positive correlation between release year and the number of ratings, meaning that more recent movies tend to receive more ratings.
#This happens because modern films are exposed to larger audiences on digital platforms, while older films accumulate fewer user ratings overall.

df[, c("release_year", "rating")]
tmp = as.data.frame(table(df$release_year))
tmp$Var1 = as.numeric(as.character(tmp$Var1))
cor(tmp$Var1, tmp$Freq)
plot(tmp$Var1, tmp$Freq, main="Number of ratings per year",
     xlab="Release year", ylab="Number of ratings",
     pch=16, col="blue")

tmp1 = tmp[tmp$Var1 < 1980, ]
cor(tmp1$Var1, tmp1$Freq)

tmp2 = tmp[tmp$Var1 >= 1980 & tmp$Var1 < 1995, ]
cor(tmp2$Var1, tmp2$Freq)

tmp3 = tmp[tmp$Var1 >= 1995, ]
cor(tmp3$Var1, tmp3$Freq)

# 4Each genre shows different trends over time.
#Western movies peak mainly in early decades, Romance movies are more evenly distributed but grow after mid-century, and Sci-Fi/Fantasy increases strongly in later decades.
#When looking at percentages (relative to all movies produced), the rise of Sci-Fi/Fantasy in recent years is especially clear.
western = mi[mi$Western == 1, c("title", "release_year")]
romance = mi[mi$Romance == 1, c("title", "release_year")]
scifi_fantasy = mi[mi$SciFi == 1 | mi$Fantasy == 1, c("title", "release_year")]

all = as.data.frame(table(mi$release_year))
all$Var1 = as.numeric(as.character(all$Var1))

w = as.data.frame(table(western$release_year))
w$Var1 = as.numeric(as.character(w$Var1))
w = merge(x = w, y = all, by = "Var1")
w$Percentage = w$Freq.x / w$Freq.y

r = as.data.frame(table(romance$release_year))
r$Var1 = as.numeric(as.character(r$Var1))
r = merge(x = r, y = all, by = "Var1")
r$Percentage = r$Freq.x / r$Freq.y

sf = as.data.frame(table(scifi_fantasy$release_year))
sf$Var1 = as.numeric(as.character(sf$Var1))
sf = merge(x = sf, y = all, by = "Var1")
sf$Percentage = sf$Freq.x / sf$Freq.y

plot(w$Var1, w$Percentage, pch=16, col="darkorange", main="Western")
plot(r$Var1, r$Percentage, pch=16, col="deeppink", main="Romance")
plot(sf$Var1, sf$Percentage, pch=16, col="turquoise", main="Scifi+Fantasy")
