# week6quiz.R
# [For your convenience], here is the provided code from Jared Lander's R for Everyone, 
# 6.7 Extract Data from Web Sites

#install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)

# 1. What type of data structure is bowlpool? 

#### Answer 1 ####
print(paste("The data structure for class bowlPool is ", class(bowlPool)))

# 2. Suppose instead you call readHTMLTable() with just the URL argument,
# against the provided URL, as shown below

theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)

# What is the type of variable returned in hvalues?

#### Answer 2 ####
print(paste("The type of  hvalues is ", typeof(hvalues)))

# 3. Write R code that shows how many HTML tables are represented in hvalues

#### Answer 3 ####
count=0
for(h in hvalues){
  if(!is.null(h)){count = count + 1}
}
print(paste("The number of HTML tables in hvalues are : ",count))
  

# 4. Modify the readHTMLTable code so that just the table with Number, 
# FirstName, LastName, # and Points is returned into a dataframe

#### Answer 4 ####
theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL, which = 1)
print(hvalues)

# 5. Modify the returned data frame so only the Last Name and Points columns are shown.

#### Answer 5 ####
hvalues<-hvalues[,3:4]
print(hvalues)

# 6 Identify another interesting page on the web with HTML table values.  
# This may be somewhat tricky, because while
# HTML tables are great for web-page scrapers, many HTML designers now prefer 
# creating tables using other methods (such as <div> tags or .png files).  

#### Answer 6 ####
theURL <- "http://www.onixs.biz/fix-dictionary.html"
tvalues <- readHTMLTable(theURL)

# 7 How many HTML tables does that page contain?

#### Answer 7 ####
count=0
for(h in tvalues){
  if(!is.null(h)){count = count + 1}
}
print(paste("The number of HTML tables in tvalues are : ",count))


# 8 Identify your web browser, and describe (in one or two sentences) 
# how you view HTML page source in your web browser.
# My web browser is Internet Explorer 11. You can view the HTML page source using
# the following three options:
#### Answer 8 ####
print("My web browser is Internet Explorer 11. You can view the HTML page source using the following three options:")
print( '1) Right-Click on the page and select "View Source" from the pop up menu.')
print( '2) Click on the "View" menu item and select "source".')
print( '3) Type the key combination "Ctrl-U". (The Ctrl key and U key together)')
