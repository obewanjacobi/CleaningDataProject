# README
# Getting and Cleaning Data Project

## Content

I will lay out each step of my code here. If you look at the R script, it has a number of what looks like headings. The content in this README will directly follow those headings, and help explain each step of what it does. To find out names of things and what they mean, please check the code book given in the repo. Here is how I will lay out the content from here:

Test data frame

Train data frame

Put the data frames together

Renaming activity values

simplifying the data

Finally, writing our tidy data set


## Test Data Frame

The first thing done in this section is that I read in the data from the text files in the folder "UCI HAR Dataset". This folder (required to download for assignment) must be in your working directory for the script to run properly. Once this is downloaded, the files can be read into R. The next thing I did was make the vector feature_labels. This vector contains all of the names for the variables in the newly made X_test data frame. The reason that I also pasted the numbers 1 through 561 on the columns (THIS IS IMPORTANT) is because there were repeated column names in the features data set. The odd thing is that even though there were repeated names, the data inside of those variables were not the same. So to make up for this possible mistake made by the original makers of the data, I added numbers onto each variable that matches their column name to make each column distinct. After this I made the names for the subject and activity columns, and finally made the data frame for the test variables. 

## Train Data Frame

This section is almost identical to the "Test Data Frame", except we are now working with the data set of training data. However, nothing really needs to be treated differently in the code because this data set is using the same variables and layout.

## Put the Data Frames Together

This section is simple. Using the rbind function we can put the two data frames together by rows.

## Renaming Activity Values

This section changes the values of activity that were previously labeled as numbers into characters containing information about the activity. This helps to make the data frame more descriptive than it previously was before. The mapvalues function works perfectly for this purpose.

## Simplifying the Data

This section is reliant on the package dplyr being installed. First using the select() function I was able to take out any column variables that didn't have to do with the mean or standard deviation of a variable. Next, using the summarise() function I took the mean of each variable based on the subject and the activity they were doing to make our data set clean and concise. 

## Finally, Writing Our Tidy Data Set

This section almost explains itself. Using write.table() I wrote the final data frame into a text file to make our tidy data set that can be read in easily by R for future work. To read this into R again, just use the code:

data <- read.table("./run_analysis.txt", header = TRUE)

View(data)


