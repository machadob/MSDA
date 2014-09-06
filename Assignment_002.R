#### Problem 1 ####
(x<-floor(runif(20,5,15)))
print(x)
#Result:14 14 13 11  5  5  7  6 13  8 11  9 13 11  7 11  9 14 11 13

#### Problem 2 ####
(c<-as.character(x))
#Result:"14" "14" "13" "11" "5"  "5"  "7"  "6"  "13" "8"  "11" "9"  "13" "11" "7"

#### Problem 3 ####
(f<-factor(x))
#Result: 14 14 13 11 5  5  7  6  13 8  11 9  13 11 7  11 9  14 11 13
          #Levels: 5 6 7 8 9 11 13 14

#### Problem 4 ####
levels(f) 
#Result: [1] "5"  "6"  "7"  "8"  "9"  "11" "13" "14"

#### Problem 5 ####
quadratic<-function(input){
  return(3*input^2 - 4*input + 1)
}
quadratic(x)

#Result:533 533 456 320  56  56 120  85 456 161 320 208 456 320 120 320 208 533 320
      # [20] 456

#### Problem 6 ####
X=matrix(c(1,1,1,1,1,1,1,1,5,4,6,2,3,2,7,8,8,9,4,7,4,9,6,4),nrow=8,ncol=3)
y=matrix(c(45.2,46.9,31.0,35.3,25.0,43.1,41.0,35.1),nrow=8,ncol=1)
B=solve(t(X)%*%X)%*%(t(X)%*%y)
print(B)
#Result:
#3.153126
#1.983743
#3.999539

#### Problem 7 ####
a=1:10
namedList=setNames(as.list(a), as.character(a))
print(namedList$'1')
#Result: 1  ## Can also use print(namedList) to print the whole list

#### Problem 8 ####
startdate <- as.Date(c('2010-11-1','2008-3-25','2007-3-14','2008-3-25','2008-3-25','2008-3-25','2008-3-25','2008-3-25','2008-3-25','2008-3-25'))
salary <- c(21000, 23400, 26800, 24400, 23400, 23500, 26400, 23700, 24400, 23460)
employee <- c('John','Peter','Jolie','bob','hope','paul','leo','jack','lynn','tom')
review<-factor(c('excellent','good','ok','good','good','good','ok','ok','excellent','excellent'))
employee <- data.frame(employee, salary, startdate,review)
print(employee)
#Result:

#### Problem 9 ####

#Result:

#### Problem 10 ####
inputfile=read.csv("temperatures.csv")
#Result:

#### Problem 11 ####
setwd("c:/Burton")
data <- read.table("measurements.tsv", sep="\t")
#Result:

#### Problem 12 ####
input <- read.csv(url("http://homepages.wmich.edu/~m3schul1/pipetest.psv"),sep="|")
#Result:

#### Problem 13 ####
total<-1
for(i in 1:12){
  total<-total*i
}
print(total)
#Result:47 9001600

#### Problem 14 ####
total<-0
initialAmount<-1500
interestRate<-0.0324
numberOfMonths<-72
mutiplyingFactor<-1
for(i in 1:numberOfMonths){
  mutiplyingFactor<-mutiplyingFactor*(1+0.0324)
}
total<-initialAmount*mutiplyingFactor
print(total)
#Result:14898.65

#### Problem 15 ####
v<-1:20
sum<-0
index<-3
while(index<20){
  sum<-sum+v[index]
  index<-index+3
}
print(sum)
#Result:63

#### Problem 16 ####
sum=0
for(i in 1:10){
  sum<-sum+2^i
}
print(sum)
#Result: 2046

#### Problem 17 ####
counter<-10
sum<-0
while(counter>0){
  sum<-sum+2^counter
  counter<-counter-1
}
print(sum)
#Result: 2046

#### Problem 18 ####
sum(2^(1:10))
#Result: 2046

#### Problem 19 ####
seq(from=20, to=50, by=5)
#Result: 20 25 30 35 40 45 50

#### Problem 20 ####
rep(c("example"), each=10)

#Result: "example" "example" "example" "example" "example" "example" "example" "example" "example" "example"S

#### Problem 21 ####
#input the 3 coefficients from the keyboard the following lines have to be use
#a=scan("",n=1,quiet=TRUE)
#b=scan("",n=1,quiet=TRUE)
#c=scan("",n=1,quiet=TRUE)
#example quadratic equation is x^2+5x+6 (roots are -2 and -3) (coefficients are a=1, b=5, c=6)
quadratic<-function(a,b,c){
  if( (b^2 - 4*a*c) < 0){
    print("This equation has no roots")
  }else{
    root1 <- (-b + ((b^2-4*a*c))^.5)/2*a
    root2 <- (-b - ((b^2-4*a*c))^.5)/2*a
    print(root1)
    print(root2)
  }
  
}
a<-1
b<-5
c<-6
quadratic(a,b,c)

#Result: -2 -3


