
#library(devtools)
#build_github_devtools()

#### Restart R before continuing ####
#install.packages("devtools.zip", repos = NULL)

# Remove the package after installation
#unlink("devtools.zip")
#install_github("hadley/rvest")


library(rvest)
# Uncomment the code below to run the sample code

# lego_movie <- html("http://www.imdb.com/title/tt1490017/")
# 
# rating <- lego_movie %>% 
#   html_nodes("strong span") %>%
#   html_text() %>%
#   as.numeric()
# rating
# cast <- lego_movie %>%
#   html_nodes("#titleCast .itemprop span") %>%
#   html_text()
# cast
# poster <- lego_movie %>%
#   html_nodes("#img_primary img") %>%
#   html_attr("src")
# poster

# The code below reads the popular site wolfram alpha and gets 
# two pieces of text using their ids
mypage<-html("http://www.wolframalpha.com/")
mytext <- mypage %>%
  html_nodes("#i-examples") %>%
  html_text()
print(mytext)

mypage<-html("http://www.wolframalpha.com/")
mytext <- mypage %>%
  html_nodes("#ef-title b") %>%
  html_text()
print(mytext)
