#*************************************************************************
#Course: Getting and Cleaning Data
#Purpose: Reading from Hierarchial Data Format (HDF5)
#Date: 17/3/2020
#Author: Lucy Njoki
#Lacturer: Jeff
#*************************************************************************

##HDF5 - used for storing large datasets, structured data sets.
#HDF5 - data is stored in groups which contain zero or more datasets, along with their metadata.
#Each group has a GGROUP HEADER, GROUP NAME and a list of ATTRIBUTES corresponding to that group.

rm(list = ls())

#----------------------------------------------------------------------
#creating hdf5 file----
#----------------------------------------------------------------------
library(rhdf5)

creatFile <- h5createFile("eample.h5")
creatFile

#creating groups within the file
created <- h5createGroup("eample.h5", "foo")
created <- h5createGroup("eample.h5", "bac")
created <- h5createGroup("eample.h5", "foo/foobaa") 

#lists elements of the particular h5file
h5ls("eample.h5")

#----------------------------------------------------------------------
#Write to groups----
#----------------------------------------------------------------------
A = matrix(1:10, nr = 5, nc= 2)
h5write(A, "eample.h5", "foo/A")

B = array(seq(1.0,2.0, by = 0.1), dim = c(5,2,2))

attr(B, "scale") <- "liter" # creaing attribute and giving it meta data

h5write(B, "eample.h5", "foo/foobaa/B")

h5ls("eample.h5")

#---------------------------------------------------------------------
#Write a dataset----
#---------------------------------------------------------------------
#the dataset is added to the top level group

df <- data.frame(1L:5L, seq(0,1, length.out = 5),
                 c("ab", "bc", "fdc", "l","k"), stringsAsFactors = FALSE)

h5write(df, "eample.h5", "df") #df is the top level group

h5ls("eample.h5")

#----------------------------------------------------------------------
#Reading Data----
#----------------------------------------------------------------------
#h5read()
readA <- h5read("eample.h5", "foo/A")
readB <- h5read("eample.h5", "foo/foobaa/B")
readdf <- h5read("eample.h5", "df")

#----------------------------------------------------------------------
#Writing and Reading Chunks----
#----------------------------------------------------------------------
#the first 3 rows, in column 1 of the dataset A in the hdf5 file to be 12, 13, 14
h5write(c(12,13,14), "eample.h5", "foo/A", index = list(1:3, 1))

h5read("eample.h5", "foo/A")

