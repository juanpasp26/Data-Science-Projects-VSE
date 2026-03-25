df=read.csv("/Users/juansandoval/Downloads/movies_info.csv")
# Then create/ examine movies dfiewed by user with ID 14:
# 1. visualize ratings distribution by user 14 using a suitable graph
df$rating
table(df$rating)
barplot(table(df$rating), main = "Ratings Distribution of ALL users",
        col ="gold", xlab ="No. of Stars", ylab="No. of Movies")
mean(df$rating)

# 2. what genres he/she review?
sum(df$Drama)
sum(df$Comedy)
sum(df$Romance)
#use the apply function to automize :

df[,5:20]
apply(X=df[,5:20], MARGIN=2, FUN=sum)
#OR
apply(df[,5:20], 2, sum) #quicker version
genres=apply(df[,5:20], 2, sum)
barplot(genres)
#the above barplot graph is messy, so sorting it from highest top lowest can help us visualize better

sort(genres, decreasing = TRUE)
barplot(sort(genres, decreasing = TRUE), main= "Ratings of user by Genre", col = rainbow(20))

# 3. what movies he/she reviewed  scored the highest ratings?
min(df$rating)
df$title[df$rating==max(df$rating)]
# 4. what movies he/she reviewed  scored the lowest ratings?
df$title[df$rating==min(df$rating)]


#Dramas movies are the highly rated
# Musical movies are the lowest rated 


