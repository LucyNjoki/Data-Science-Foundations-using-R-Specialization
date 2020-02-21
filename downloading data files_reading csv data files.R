#**********************************************************************
#Project: Data Science: Foundations using R specialization
#Course: Getting and Cleaning Data
#Author: Lucy Njoki
#Date: February 21, 2020
#**********************************************************************

#clear the environment
rm(list = ls())

#checking for a directory
if(!file.exists("data")){
  dir.create("data")
}

#getting data from the internet
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "cameras.csv", 
              method = "curl")
dateDownloaded <- date()
dateDownloaded

#checking data files or directories on the named directory
list.files("/.data")

#loading camera data(.csv)
camera_data <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
head(camera_data)


#getting and loading xlsx format
fileURL1 <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD&bom=true&format=true"
download.file(fileURL1, destfile = "cameras.xlsx", method = "curl")