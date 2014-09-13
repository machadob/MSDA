
#### Problem 1 ####
#Add the values in the vector and then divide the total by the number of values
f1=function (x) { sum(x)/length(x) }
print(f1(c(1.2,1.5,2.7)))
#result: 1.8

#### Problem 2 ####
f2=function (x){sum (x [! is.na (x)])/length (x [! is.na (x)])}
print(f2(c(1.2,1.5,NA,2.7,NA)))
#result: 1.8

#### Problem 3 ####
gcd <- function(num1,num2) ifelse (num2==0, num1, gcd(num2, num1 %% num2))
print(gcd(175,25))
#result: 25

#### Problem 4 ####
gcd2<-function(num1, num2){
  if(num1 == num2){
    return(num1)
  }
  while(num1 != num2){
    if(num1 < num2){
      num2 = num2 - num1
    }else{
      num1 = num1 - num2
    }
  } 
  return(num1)
}
print(gcd2(175,25))
#result: 25

#### Problem 5 ####
f2<-function (x, y){
  return((x^2)*y + 2*x*y - x*(y^2))
}
print(f2(3,4))
#Result 12

#### Problem 6 ####
d1=read.csv ('c:/Burton/week-3-price-data.csv')
d2=read.csv ('c:/Burton/week-3-make-model-data.csv')
m=merge (d1, d2, by.x="ModelNumber")
print(nrow(m))
#Result 27
# There are 27 observations in the merge though there are 28 rows in price-data. This is because the defaultvalue of 'all' is
# false, which results in a natural join which excludes rows that don't have a corresponding matching value in 
# both the tables.

#### Problem 7 ####
m=merge (d1, d2, by.x="ModelNumber",all.x=TRUE)
print(nrow(m))
#Result 28

#### Problem 8 ####
n<-na.omit(m[m$Year==2010, ])
print(n)

#### Problem 9 ####
o<-na.omit(m [( (m$Color=="Red")&(m$Price> 10000) ), ])
print(o)

#### Problem 10 ####

p<-subset (o, select=-c (ModelNumber, Color))
print(p)

#### Problem 11 ####
g<-function(x){
  return(nchar (x))
}
r=c ("one","two","three")
v=g(r)
print(v)
#Result: 3 3 5

#### Problem 12 ####
#Use runif (10,11,2) to generate 10 random numbers from 11 to 20
h<-function(x,y){
  if(length(x) != length(y)){
    return("The lengths of the arguments do not match")
  }else{
    z=paste (x, y, sep=" ")
    print(z)
  }
}
c1<-c("one", "two", "three")
c2<-c("four", "five", "six")
h(c1,c2)

#### Problem 13 ####
#aeiou are the vowels
p<-function(x){
  m<-regexpr("[aeiou]..",x,perl=TRUE)
  r<-regmatches(x,m)
  if(length(r) == 0){
    return("No vowel found")
    }else{
    return(r)
    }
}
s<-"bllten"
print(p(s))

#### Problem 14 ####

mm=as.integer (runif (20,1,13))              
dd=as.integer (runif (20,1,32))                            
yy=as.integer (runif (20,2000,2014))                                           
d=data.frame (mm, dd, yy)                                          
d$new=paste(d$mm ,d$dd, d$yy, sep="-")
print(d)
                                             
                                             
#### Problem 15 ####                              
dd<-as.date("05-14-1967", format="%m-%d-%Y")
print(dd)
                              
#### Problem 16 ####       
dd<-as.date("05-14-1967", format="%m-%d-%Y")
month (dd)
               
#### Problem 17 ####
dateRange=as.date (as.date ("01-01-2005", format="% m-%d-%Y"):as.date ("12-31-2014",format="% m-%d-%Y"), origin="1970-01-01")


