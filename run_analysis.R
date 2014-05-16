# Project Assignment for "Getting and Cleaning Data" Coursera 

# Read in training and test data

train_data <- read.table("X_train.txt", stringsAsFactors=FALSE, header=FALSE)

test_data<- read.table("X_test.txt", stringsAsFactors=FALSE, header=FALSE)

#Read features data and assign as variables in training and test data
  
features<- read.table("features.txt", stringsAsFactors=TRUE, header=FALSE)

