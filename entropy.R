
entropy<-function(d){
  result=0
  v<-unique(d)
  for(i in v){
      prob_i<-length(d[d==i])/length(d)
      result<-result + prob_i*log2(prob_i)
  }
  return(-result)
}

infogain<-function(d, a){
  v<-unique(a)
  temp<-0
  for( j in v){
     temp = temp + (length(d[a==j])/length(d))*entropy(d[a==j])
  }
  infogain = entropy(d) - temp
  return(infogain)
}

decide<-function(df, num){
  n<-names(df)
  n<-n[-which(names(df) == names(df[num]))]
  v=c()
  for( i in 1:length(df)){
      if(i != num){
        v<-append(v, infogain(df[[num]], df[[i]]))
     }
   }
  maxgain<-order(v,decreasing=T)[1]
  names(v)<-n
  l <- list("max" = maxgain, "gains" = v)
  return(l)
}

dataset=read.csv ('c:/Burton/entropy-test-file.csv')
entropy(dataset$answer)
infogain(dataset$answer, dataset$attr1)
infogain(dataset$answer, dataset$attr2)
infogain(dataset$answer, dataset$attr3)
decide(dataset, 4)
