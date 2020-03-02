#********************************************************************
#Course: Get and Clean Data
#Task:Reading XML and JSON files in R and vice versa
#Date: 27/2/2020
#Acknowledge: Jeffrey Leek
#*******************************************************************

#Reading XML file in R----

#*******************************************************************

rm(list = ls())

#required packages----
library("XML")
library("RCurl")

#EXAMPLE 1 ----

#file url
fileURL <- getURL("https://www.w3schools.com/xml/simple.xml")

#storing data in R environment
doc <- xmlTreeParse(fileURL, useInternal = TRUE)
doc

#assessing the XMLNode object resulting from parsing an xml document
rootNode <- xmlRoot(doc)
rootNode

names(rootNode) #names of the XMLNode object

##LISTING
#assesssing the first & fifth part of the XMLNode object
rootNode[[1]]
rootNode[[5]]

##SUBLISTING
#assesssing the 1st element of the 1st part of the XMLNode object
rootNode[[1]][[1]]

rootNode[[2]][[4]]

##Extracting parts of the file
xmlSApply(rootNode, xmlValue) #extracting values in the whole document

xpathSApply(rootNode, "//name", xmlValue) #names

xpathSApply(rootNode, "//price", xmlValue) #price

xpathSApply(rootNode, "//calories", xmlValue) #calories

xpathSApply(rootNode, "//description", xmlValue) #description


#EXAMPLE 2----
file_url <- "https://www.espn.com/nfl/team/_/name/bal/year/2019"
download.file(file_url, "./2019.html")

doc.1 <- htmlTreeParse("./2019.html", useInternal = TRUE)
doc.1

GameDate <- xpathSApply(doc.1, "//div[@class = 'game-date']", xmlValue)
GameDate

teams <- xpathSApply(doc.1, "//li[@class = 'team-name']", xmlValue)
teams


#****************************************************************************************
#Reading JSON file in R----
#********************************************************************************
library("jsonlite")

jsondata <- fromJSON("http://api.github.com/users/jtleek/repos")

names(jsondata)

names(jsondata$owner)

#Writing Dataframes to JSON
#R to JSON
myjson <- toJSON(iris, pretty = TRUE)

cat(myjson)

#convert back yo JSON
iris.2 <- fromJSON(myjson)
head(iris.2)