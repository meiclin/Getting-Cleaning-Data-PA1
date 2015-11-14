<<<<<<< HEAD
#Getting and Cleaning Data Peer Assessment
##Original Data
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##How the scripts work and how they are connected
####In the run_analysis.R script,

1. Call library "reshape2" package

2. Read the column names of "features.txt"

3. Read and relabel "activities_labels.txt"

4. Read and relabel all train data in train folder with "activityID" and "subjectId" 

5. Read and relabel all test data in test folder with "activityID" and "subjectId" 

6. Combine test dataset and train dataset, and then merge all data

7. All the columns with mean() and std() values are extracted by "grep" function. Then create a new data frame including "activityID" and "subjectID" and the mean() & std() columns.

8. Merge descriptive activity names and the mean & std values dataset by "merge" function, and get one dataset with descriptive activiy names.

9. Convert data by "melt" and "dcast" functions from "reshape2" library into a table containing all features' mean values, and ordered by the activityName and subjectId.

10. Create a new file, call "tidyData.txt" in the same folder.
=======
# Getting-Cleaning-Data-PA1
>>>>>>> b66b9f4e8b7475f64f4c5dbdd437b1862909704d
