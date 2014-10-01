print("Q1) Which age group had the most number of people who liked Cullen skink the most?")
print("Q2) Which age group had the highest proportion of people who liked Cullen skink the most?")
print("Q3) Was the number of people who liked cullenskink same is all cities??")

library(plyr)
library(dplyr)
library(reshape2)
library(tidyr)
library(magrittr)

city<-c('Edinburg','Edinburg','Glassgow', 'Glassgow')
age_group<-c('16_to_24','25_Plus','16_to_24','25_Plus')
yes<-c(80100, 143000, 99400, 150400)
no<-c(35900, 214800, 43000, 207000)
df<-data.frame(city,age_group,yes,no)
df<-gather(df,city,age_group,yes,no)
names(df)<-c('city','age_group','response','count')
yes_group<-ddply(subset(df,response=='yes'),c('age_group','response'),function(x) c(total_count=sum(x$count)))
q1<-(arrange(yes_group,-total_count))[1,]
sprintf("Answer Q1: The age_group %s had the most number of people who liked cullen skink the most with a total count of %s", q1$age_group, q1$total_count)
no_group<-ddply(subset(df,response=='no'),c('age_group','response'),function(x) c(total_count=sum(x$count)))
yes_16_24<-subset(yes_group,age_group=='16_to_24', select=c(total_count))
no_16_24<-subset(no_group,age_group=='16_to_24', select=c(total_count))
yes_25_Plus<-subset(yes_group,age_group=='25_Plus', select=c(total_count))
no_25_Plus<-subset(no_group,age_group=='25_Plus', select=c(total_count))
proportion_16_24<- (yes_16_24)/(yes_16_24 + no_16_24)
proportion_25_Plus<- (yes_25_Plus)/(yes_25_Plus + no_25_Plus)
sprintf("The proportion in age group 16_24 is %s and in age group 25_plus is %s",proportion_16_24, proportion_25_Plus)
if(proportion_16_24 > proportion_25_Plus){
  print("Answer Q2: The proportion of people that liked cullen skink is greater in age group 16_24 ")
}else{
  print("Answer Q2: The proportion of people that liked cullen skink is greater in age group 25_plus ")
}
yes_per_city <- ddply(subset(df,response=='yes'),c('city','response'),function(x) c(total_count=sum(x$count)))
#Could have used a loop here
sprintf("The number of people who liked cullen skink in city %s is %s",yes_per_city[1,1], yes_per_city[1,3])
sprintf("The number of people who liked cullen skink in city %s is %s",yes_per_city[2,1], yes_per_city[2,3])
if(yes_per_city[1,3] == yes_per_city[2,3]){
  print("Answer Q3: The number of people who liked cullen skink IS the same in both cities")
}else{
  print("Answer Q3: The number of people who liked cullen skink IS NOT the same in both cities")
}


