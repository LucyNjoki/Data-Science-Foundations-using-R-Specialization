#******************************************************************************
#Reading from the web
#Date: 17/3/2020
#Author: Lucy Njoki
#Acknowledge: Jeff 
#*****************************************************************************

rm(list = ls())

#------------------------------------------------------------------------
#Getting data off webpages----
#------------------------------------------------------------------------

con <- url("http://scholar.google.com/citations?user=H1-16COAAAAJ$hi=en")

htmlCode <- readLines(con)

close(con)
htmlCode

#------------------------------------------------------------------------
#Parsing with XML----
#------------------------------------------------------------------------
library(XML)

Url <- "http://scholar.google.com/citations?user=H1-16COAAAAJ$hi=en"

html <- htmlTreeParse(Url, useInternalNodes = T)

#checking the title of the searched page
xpathSApply(html, "//title", xmlValue)

#checking the citation
xpathSApply(html, "//td[@id = 'col-cited by']", xmlValue)

#-----------------------------------------------------------------------
#Using httr package----
#-----------------------------------------------------------------------

library(httr)

html2 <- GET(Url)

#reading the content as a text
content2 <- content(html2, as = "text")

parsedHtml <- htmlParse(content2, asText = TRUE)

xpathSApply(parsedHtml, "//title", xmlValue)

#----------------------------------------------------------------------
#Accessing websites with passwords----
#----------------------------------------------------------------------

pg <- GET("http://httpbin.org/basic-auth/user/passwd",
          authenticate("user", "passwd"))
pg

#Always authenticate the website for you to login in.

#----------------------------------------------------------------------
#Using handles----
#----------------------------------------------------------------------
google <- handle("http://google.com")

pg1 <- GET(handle = google, path = "/") #searching by a specific path

pg2 <- GET(handle =google, path = "search") # searching by a specific search
#Handles enable one to save the authentication across multiple accesses