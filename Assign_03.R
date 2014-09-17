# NOTE: Below each function is test data and the function call to test that particular function.
#### Problem 1 #### 
misingval_1<-function(v){
  return(length(v[is.na(v)]))
}
v <- c(1,2,3,4,NA,5,NA,NA,NA,7,NA)
misingval_1(v)

#### Problem 2 ####
missingVal_2 <-function (d){
  v<-c (misingval_1(d$l), length (d$m[is.na (d$m)]), length (d$n[is.na (d$n)]))
  names (v)<-c ("l","m","n")
  return (v)
} 
l <- c(1,2,3,NA,5,NA,7,8,9,10)
m <- c(1,2,3,NA,5,NA,7,8,NA,10)
n <- c(1,NA,3,NA,5,NA,7,NA,9,10)
df <- data.frame(l, m, n)
print(missingVal_2(df))

#### Problem 3 ####

#NOTE: I am making the mean and median calculations into seperate functions since they will be used for 
# calculating other parameters
my_median<-function(y){
  y<-sort(y)
  if(length(y)%%2 == 0){
    return((y[floor(length(y)/2)] +  y[floor(length(y)/2) + 1])/2)
  }else{
    return(y[ceiling(length(y)/2)])
  }
}

my_mean<-function(z){
  mean = 0
  for( i in z){
    mean = mean + i
  }
  mean = mean/length(z)
  print(mean)
}

#NOTE: This is the main function that will return the named list
my_stats <- function(x){
  
#Calculate missing values
missingvalues <- misingval_1(x)
  
#Minimum
x<-x[!is.na(x)] #Get rid of the missing values for other calculations
minValue<-x[1]
for(i in x[2]:length(x)){
  if(minValue>i){
    minValue=i
  }
}
print(minValue)
  
#Maximum
maxValue<-x[1]
for(i in x[2]:length(x)){
  if(maxValue<i){
    maxValue=i
  }
}
print(maxValue)
  
#Mean
meanval<-my_mean(x)
  
#Median
medianval<-my_median(x)
  
#Standard Deviation
m<-my_mean(x)
std<-0
for(i in x){
   std<-std + (m-i)^2
}
std<-(std/(length(x)))^.5
print(std)
  
#1st and 3rd Quartile
  x<-sort(x)
  if(length(x)%%2 == 0){ #even number of elements
    lowerhalf<-x[1:floor(length(x)/2)]
    upperhalf<-x[(floor(length(x)/2) + 1):length(x)]
    print(lowerhalf)
    print(upperhalf)
    first<-my_median(lowerhalf)
    third<-my_median(upperhalf)
  }else{
    lowerhalf<-x[1:ceiling(length(x)/2)]
    upperhalf<-x[ceiling(length(x)/2):length(x)]
    print(lowerhalf)
    print(upperhalf)
    first<-my_median(lowerhalf)
    third<-my_median(upperhalf)
  }
  l <- list("min" = minValue, "max" = maxValue,"mean" = meanval,"median" = medianval, "firstQ" = first,
            "thirdQ" = third, "stddev" = std, "missing" = missingvalues)
  return(l)
}# End my_stats
v <- c(1,NA,2,3,4,5,NA,6,7,NA,8,9,10,11)
print(my_stats(v))

#### Problem 4 ####
my_stats_2 <- function(v){
res<-names(sort(summary(as.factor(v)), decreasing=T)[1:2])
mostcom=res[1]
distinct = unique(v)
f<-v[!is.na(v)]
nomostcom = length(f[f==res[1]])
 
return(list("distinct" = distinct,"mostcom" = mostcom,"nomostcom" = nomostcom,"missing" = misingval_1(v)))
}
f<-c("1","1","3","4","5","6","7","8","3","10",NA)
my_stats_2(f)

#### Problem 5 ####
truefalse<-function(v){
  k<-v[!is.na(v)]
  missingval <- misingval_1(v)
  trueval <- sum(as.numeric(k))
  falseval <- sum(as.numeric(k==FALSE))
  proptrueval <- trueval/length(v)
  l <- list("trueval" = trueval, "falseval" = falseval,"proptrueval" = proptrueval,"missingval" = missingval)
}

logic<-c(TRUE,FALSE,FALSE,NA,FALSE,TRUE)
print(truefalse(logic))

#### Problem 6 ####
summarizer<-function(df){
  retlist<-list("my_stats" = my_stats(df$a), "my_stats_2" = my_stats_2(df$b), "truefalse" = truefalse(df$l))
  return(retlist)
}
a<-c(1,NA,2,3,4,5,NA,6,7,NA,10)
b<-c("1","1","3","4","5","6","7","8","3","10",NA)
l<-c(TRUE,FALSE,FALSE,NA,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,FALSE)
d<-data.frame(a,b,l)
summarizer(d)
