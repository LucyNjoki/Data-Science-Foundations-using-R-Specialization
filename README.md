# Data-Science-Foundations-using-R-Specialization: Getting and Cleaning Course by Jeffery Leek

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

To install rhdf5

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

## Sorting and Subsetting Data

### Subsetting Data

One can create a subset of data by:

>specific value;

>variable;

>on rows and columns

Also logical statements (**And(&)** and __Or(|)__) can be used to subset data

### Sorting Data

3 functions used:

>sort()

>order()

>plyr::arrange()

### Adding rows and columns in a DF

>data$newVaraible

>cbind() - adds a column to the right of the DF

>rbind() -  adds a row to the bottom of the DF
