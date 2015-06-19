#---------------------------------------------------------------------------
# Author: Jacob Townson
# Date : 06/18/2015
# Title: run_analysis.R
# Class: Getting and Cleaning Data
# This assignment takes data from Samsung phones' gyroscope and reads it
# into R to make a nice tidy dataset. 
#---------------------------------------------------------------------------

require(plyr)
require(dplyr)

## Test data frame
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"", 
                     comment.char="")
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"", 
                       comment.char="")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"", 
                     comment.char="")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"", 
                           comment.char="")

feature_labels <- paste(features$V2, 1:561)
names(X_test) <- feature_labels
names(y_test) <- "activity"
names(subject_test) <- "subject"
analysis <- cbind(subject_test, y_test, X_test)

## Train data frame
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", 
                      comment.char="")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"", 
                      comment.char="")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                            quote="\"", comment.char="")

names(X_train) <- feature_labels
names(y_train) <- "activity"
names(subject_train) <- "subject"
analysis2 <- cbind(subject_train, y_train, X_train)

## Put the data frames together

analysis <- rbind(analysis, analysis2)

## Renaming activity values

analysis$activity <- mapvalues(analysis$activity, c(1:6), 
          c('WALKING', 'WALKING_UP', 'WALKING_DOWN', 'SITTING', 'STANDING', 
            'LAYING'))

## simplifying the data

analysis <- select(analysis, subject, activity, contains("mean()"), 
                   contains("std()"))

analysis <- analysis %>% group_by(subject,activity) %>%
summarise_each(funs(mean))

## Finally, writing our tidy data set

write.table(analysis, file = "./run_analysis.txt", row.names = FALSE)






