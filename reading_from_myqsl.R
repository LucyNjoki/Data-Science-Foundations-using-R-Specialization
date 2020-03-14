#***********************************
#Purpose: Reading from mySQL
#Date: 14/3/2020
#Author: Lucy Njoki
#Lacturer: Jeff
#***********************************

rm(list=ls())

rm(list = ls())

library("RMySQL")

ucscDb <- dbConnect(MySQL(), user = "genome", 
                    host = "genome-euro-mysql.soe.ucsc.edu")
#apply query

result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);

#Shows all the databases in the server.
#Show databases; - mysql command that we send to the server.
#Please note, it is important to disconnect from a server after collecting data.
#------------------------------------------------------------------------------
#Connecting to hg19 and Listing tables
#------------------------------------------------------------------------------
hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-euro-mysql.soe.ucsc.edu")

#checking all databases in the server
allTables <- dbListTables(hg19)

length(allTables)

#checking the first five tables(DB)
allTables[1:5]

#-------------------------------------------------------------------------------
#Get dimensions of a specific table
#-------------------------------------------------------------------------------

#Fields are equivalent to Columns
dbListFields(hg19, "affyU133Plus2")

#Rows are equivalent to the records
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

#Count(*) all the rows in the database

#------------------------------------------------------------------------------
#Read from the table
#------------------------------------------------------------------------------

affyData <- dbReadTable(hg19, "affyU133Plus2")

head(affyData)

#------------------------------------------------------------------------------
#Select a specific subset
#------------------------------------------------------------------------------

#select obs from the data table
query <- dbSendQuery(hg19, 
                     "select * from affyU133Plus2 where misMatches between 1 and 3")

#fetch the query
affyMis <- fetch(query);quantile(affyMis$misMatches)

#fetches the 10 obs
affyMisSmall <- fetch(query, n = 10); dbClearResult(query) #must disconeect the query

dim(affyMisSmall)

#disconnect the connection
dbDisconnect(hg19)
