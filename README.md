# Data-Science-Foundations-using-R-Specialization: Getting and Cleaning Course

**Codes for the course: Getting and Cleaning Data**

## Reading XML file

Install XML package: install.packages("XML")

## Reading JSON file

Install jsonlite package: install.packages("jsonlite")

## Reading from mysql
1. Install mySQL

For windows users 

i) [https://dev.myql.com/doc/refman/5.7/en/installing.html]

ii) Check official instructions: [https://biostat.mc.vanderbilt.edu/wiki/Main/RMySQL]

2. install RMySQL package

install.packages("RMySQL")

## Reading from HDF5

To Install _rhdf5_ package:

source("https://bioconductor.org/install/biocLite.R")

if (!requireNamespace("BiocManager", quietly = TRUE))

install.packages("BiocManager")

BiocManager::install(version = "3.10")

BiocManager::install("rhdf5")

## Reading from the Web

_Reading from the web can be done using 3 methods. That is:_

1. base::readLines()

2. XML::htmlTreeParse()

3. httr::GET()
