# Codebook for the "run_analysis.R" Script and "run_analysis.txt" Data Set

## subject

This section labels each person who's measurements were gathered. They are numbered 1 through 30. Each number stands for a different person. 

## activity

This section describes what activity the subject was doing to get the measurements that were found. 

LAYING - laying down

SITTING - sitting down

STANDING - standing in place

WALKING - walking on a level plane

WALKING_DOWN - walking down stairs

WALKING_UP - walking up stairs

## label#mean

This section includes the 561 columns to the right of the activity variable. It is labeled as such:

label - some label made by the Samsung data analysts to reflect the measure found

"#" - the number of the column from 1 to 561

mean - showing that this is the mean of multiple records of the same activity

The values in these columns reflect the mean of the measurements taken by the phone's gyroscope.

## label#sd

This section is similar to the one above. It includes the 561 columns to the right of the label#mean section. It is labeled as such:

label - some label made by the Samsung data analysts to reflect the measure found

"#" - the number of the column from 1 to 561

sd - showing that this is the standard deviation of multiple records of the same activity

The values in these columns reflect the standard deviation of the measurements taken by the phone's gyroscope.