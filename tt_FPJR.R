
# Function to create the URL in the right format for Yahoo Finance.
createURL <- function(asset){
  return(paste("http://real-chart.finance.yahoo.com/table.csv?s=", asset, "&a=10&b=01&c=2009&d=10&e=01&f=2014&g=m&ignore=.csv", sep=''))
}

#Function to monthly return of an asset (For a 5 year period).
calculateReturns <- function(assetURL){
  returns = c()
  df <- read.csv(assetURL, header=TRUE)
  for(i in 1:length(df$Adj.Close)){
    ret = (df$Adj.Close[i] - df$Adj.Close[i+1])/df$Adj.Close[i+1]
    returns <- append(returns, ret)
  }
  returns <- returns[!is.na(returns)]
  return(returns)
}

#Function to calculate beta of a stock in relation to the S&P 500 Index.
#calculateBeta <- function(returnsStock, returnsSAP){
calculateAssetBeta <- function(asset){
  returnsAsset = calculateReturns(createURL(asset))
  returnsSAP500 = calculateReturns(createURL("%5EGSPC"))
  # Find the covariance of the returns of the Stock with returns of SAP 500.
  cov_stock_sap = cov(returnsAsset, returnsSAP500)
  #Find the variance of SAP 500 returns
  var_sap = var(returnsSAP500)
  #The beta for a Stock is the ratio of covariance (of returns of the Stock and SAP 500) to the variance of SAP 500 returns.
  beta_stock = cov_stock_sap/var_sap
  return(beta_stock)
}

print("---------------------------------------------------------------------------------")

calculatePortfolioBeta <- function(portfolio){
  noOfAssetsInPortfolio = length(portfolio[[1]])
  totalQtyInPortfolio = sum(portfolio[[2]])
  finalBeta = 0.0
  for( i in 1:length(portfolio[[1]])){
    assetBeta = calculateAssetBeta(portfolio[[1]][i])
    percentageQty = (portfolio[[2]][i]*100/totalQtyInPortfolio)/100
    finalBeta = finalBeta + assetBeta*percentageQty
  }
  return(finalBeta)
}

# Create some portfolios with a mix of stocks and varying quantities
portfolio_1 <- list(c('IBM','YHOO', 'AAPL'), c(50, 50, 25))
portfolio_2 <- list(c('IBM','YHOO', 'AAPL'), c(30, 30, 65))

#Calculate Beta for all the profolios

portfolio_1_beta = calculatePortfolioBeta(portfolio_1)
portfolio_2_beta = calculatePortfolioBeta(portfolio_2)
