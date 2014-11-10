library(plyr)

#Read the files into seperate data frames
orders = read.csv("C:/Temp/Orders/Orders.csv", header = TRUE, stringsAsFactors=FALSE)
orderDetails = read.csv("C:/Temp/Orders/OrderDetails.csv", header = TRUE, stringsAsFactors=FALSE)
products = read.csv("C:/Temp/Orders/Products.csv", header = TRUE, stringsAsFactors=FALSE)
customers = read.csv("C:/Temp/Orders/Customers.csv", header = TRUE, stringsAsFactors=FALSE)
employees = read.csv("C:/Temp/Orders/Employees.csv", header = TRUE, stringsAsFactors=FALSE)

#Create empty vectors to store the various columns of interest from each file.
CountryList=c()
CityList=c()
CustomerIdList=c()
ProductNameList=c()
QuantityList=c()
DiscountList=c()

#The following loop will run through each order item and get all the necessary attributes
# into its respective list after which we will create a new "denormalized" data frame.
for(i in 1:nrow(orderDetails)){
  ProductName = products[orderDetails[i,"ProductID"],]$ProductName
  custid = orders[orders$OrderID==orderDetails[i,"OrderID"],]$CustomerID
  CountryList<-c(CountryList, customers[customers$CustomerID==custid,]$Country)
  CityList<-c(CityList, customers[customers$CustomerID==custid,]$City)
  CustomerIdList<-c(CustomerIdList, custid)
  ProductNameList<-c(ProductNameList, ProductName)
  QuantityList<-c(QuantityList, orderDetails[i,"Quantity"])
  DiscountList<-c(DiscountList, orderDetails[i,"Discount"])
}
#Create the new "denormalized" data frame.
ordersDF<-data.frame(Country=CountryList, City=CityList, CustomerId=CustomerIdList, ProductName=ProductNameList, Quantity=QuantityList, Discount=DiscountList)

#The Result data frame below contains the aggregate quatity grouped by Country, City and Customer.
TotalQtyDF<-ddply(ordersDF, c('Country','City','CustomerId','ProductName'), function(x)c(TotalQty=mean(x$Quantity)))

head(TotalQtyDF)

#Save the new dataframe.
save(ordersDF, file = "c:/Temp/orders.RData")
#Write the processed data to a new csv to read into mongodb later.
write.csv(ordersDF, "c:/Temp/orders.csv")
#Load it back using the command below(Commented)
#load(file = "c:/Temp/orders.RData")