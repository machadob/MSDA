#### Problem 1a ####
# All results printed from the output of the R console.
queue<-c('James', 'Mary', 'Steve', 'Alex', 'Patricia')
print(queue)
#Result: [1] "James"    "Mary"     "Steve"    "Alex"     "Patricia"

#### Problem 1b ####
queue<-append(queue, 'Harold')
print(queue)
#Result: [1] "James"    "Mary"     "Steve"    "Alex"     "Patricia"     "Harold"


#### Problem 1c ####
queue <- queue[-which(queue=='James')]
print(queue)
#Result:  [1] "Mary"     "Steve"    "Alex"     "Patricia" "Harold" 


#### Problem 1d ####
queue<-append(queue,'Pam', after=1)
print(queue)
#Result: [1] "Mary"     "Pam"      "Steve"    "Alex"     "Patricia" "Harold" 


#### Problem 1e ####
queue<-head(queue,-1)
print(queue)
#Result: [1] "Mary"     "Pam"      "Steve"    "Alex"     "Patricia"


#### Problem 1f ####
queue <- queue[-which(queue=='Alex')]
print(queue)
#Result: [1] "Mary"     "Pam"      "Steve"    "Patricia"


#### Problem 1g ####
match('Patricia',queue)
#Result: [1] 4


#### Problem 1h ####
length(queue)
#Result: [1] 4


#### Problem 2 ####
seq(from=20, to=50, by=5)
#Result: 20 25 30 35 40 45 50

#### Problem 20 ####
rep(c("example"), each=10)

#Result: "example" "example" "example" "example" "example" "example" "example" "example" "example" "example"S

#### Problem 2 ####
quadratic<-function(a,b,c){
  if( (b^2 - 4*a*c) < 0){
    print("This equation has no solutions (i.e. no real roots)")
  }else if( (b^2 - 4*a*c) == 0){
    root <- (-b)/2*a
    print("The equation has one root ")
    print(root)
  }else{
    root1 <- (-b + ((b^2-4*a*c))^.5)/2*a
    root2 <- (-b - ((b^2-4*a*c))^.5)/2*a
    print("The equation has two roots")
    print(root1)
    print(root2)
  }
}
#input the 3 coefficients from the keyboard the following lines have to be use
#a=scan("",n=1,quiet=TRUE)
#b=scan("",n=1,quiet=TRUE)
#c=scan("",n=1,quiet=TRUE)
#example quadratic equation is x^2+5x+6 (roots are -2 and -3) (coefficients are a=1, b=5, c=6)
a<-1
b<-5
c<-6
quadratic(a,b,c)

#Result: -2 -3
#Result:


#### Problem 3 ####
n<-1:1000
p<-n[!(n%%3 == 0)]
q<-p[!(p%%7 == 0)]
result<-q[!(q%%11 == 0)]
#print(result)  #NOTE: uncomment this statement to get all the numbers.
print(length(result))
#Result:[1] 520  i.e. There are 520 numbers that are neither divisible by three, nor by seven, nor by 11 

#### Problem 4 ####
#f=scan("",n=1,quiet = FALSE)
#g=scan("",n=1,quiet = FALSE)
#h=scan("",n=1,quiet = FALSE)
f=3
g=4
h=5
v=sort(c(f,g,h))
if(v[1]^2+v[2]^2==v[3]^2){
  print("The numbers you entered form a Pythagorean Triple")
}else{
  print("The numbers you entered DO NOT form a Pythagorean Triple")
}

#Result:
