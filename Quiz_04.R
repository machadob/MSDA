#### Problem 1 ####
df <- read.csv('c:/Temp/movies.tab',sep='\t')
decades <- floor(df$year/10)*10
df_dec <- cbind(df,decades)
df_dec <- cbind(df_dec,"num_of_Movies"=c(rep.int(1, length(df$rating))))
df_dec <- df_dec[order(decades),]
result<-aggregate(num_of_Movies ~ decades,df_dec,FUN='sum')
library(ggplot2)
ggplot(data=df, aes(x=result$decades, y=result$num_of_Movies, group=1)) + geom_line()

#### Problem 2 ####
require(reshape2)
cols=c('title', 'year', 'length', 'budget', 'rating', 'votes', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6', 'r7', 'r8', 'r9', 'r10', 'mpaa')
# pivot by genre
pivoted_df<-melt(df,id.vars=cols)
result2<-aggregate(rating ~ variable,pivoted_df,FUN='mean')
print(result2)

#The average rating has not changed over time

#### Problem 3 ####
cor(df$rating,df$length)
#Result -0.03073441
# Since the correlation coeff is not close to 1 (or -1) there is no relationship between 
# rating and movie length

#### Problem 4 ####
cor(df$Action,df$length)
#[1] 0.1105908
cor(df$Animation,df$length)
#[1] -0.3655562
cor(df$Comedy,df$length)
#[1] -0.1014264
cor(df$Drama,df$length)
#[1] 0.2364963
cor(df$Documentary,df$length)
#[1] -0.0672991
#cor(df$Romance,df$length)
#[1] 0.1114578
cor(df$Short,df$length)
#[1] -0.6750295

#Since the correlation coeff for none of the genre's is close to 1 (or -1) there is no relationship
# between the genre and the length of the movie

#### Problem 5 ####
# The mpaa rating for R films seems lower than other ones including unrated ones.
require(reshape2)
cols_mppa=c('title', 'year', 'length', 'budget', 'rating', 'votes', 'r1', 'r2', 'r3', 'r4', 'r5', 'r6', 'r7', 'r8', 'r9', 'r10', 'Action', 'Animation', 'Comedy', 'Drama', 'Documentary', 'Romance', 'Short')
# pivot by genre
pivoted_df_2<-melt(df,id.vars=cols_mppa)
result3<-aggregate(rating ~ value,pivoted_df_2,FUN='mean')
print(result3)

