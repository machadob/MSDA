#install.packages("Rcpp")
#install.packages("microbenchmark")
library(Rcpp)
library(microbenchmark)

cppFunction('double cppAdd(NumericVector v){
  int num = v.size();


  NumericVector out(num);
  double d =0.0;
  for(int i=0; i<num; i++){
    d = v[i] + d;
  }
  return d;
}')

rSum<-function(v){
  sum = 0;
  for(i in v){
    sum = sum + i;
  }
  return(sum)
}
l<-runif(10000,1,100)
microbenchmark(rSum(l))
microbenchmark(cppAdd(l))
