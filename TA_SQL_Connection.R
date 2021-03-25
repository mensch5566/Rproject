library(httr)
library(tidyverse)
#----POST_Odin----
TA_Odin_POST <- function(Query){
  url <- 'http://148.153.162.118:8992/querySql?token=6YxmOIGY4CswUO7iL17bM0hj00aZpYxjLN2NBliBIh238i36XKCSK05VD9b4aUXp'
  headers <- c('Content-Type' = 'application/x-www-form-urlencoded')
  sql <- paste0('sql=', Query)
  format <- c('&format=tsv_header')
  POST_Query <<- POST(url,  add_headers(.headers = headers), body = paste0(sql, format))
  cat('\nstatus_code:', POST_Query$status_code)
  querydata <<- read_tsv(content(x = POST_Query, as = 'text'))
}
# Use r"()" for escaping
TA_Odin_POST(r"()")

# Retry 10 times
{
  i <- 1
  repeat{   
    tryCatch({
      TA_Odin_POST(r"(
                   
      )")},
      warning = function(msg) {
        message("Original warning message:")
        message(paste0(msg,"\n"))
        return(NULL)},
      error = function(msg) {
        message("Original error message:")
        message(paste0(msg,"\n"))
        return(NA)
      }
    )
    if(POST_Query$status_code == '200') {
      
      break
    }else if(i > 10){
      print('Retry Times Out')
      break
    }else{
      print('Stopped')
      i <- i + 1
    }
  }
}

#----Reserved----
TestFn <- function(Q){
  test <- Q
  Query <<- gsub("\'", "\\\"", test)
}

#----123----















