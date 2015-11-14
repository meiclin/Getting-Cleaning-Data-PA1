library(reshape2)
#1.Merges the training and the test sets to create one data set.
#load information
feature.data <- read.table("./data/UCI HAR Dataset/features.txt")
feature <- feature.data[,2]
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityName"))
#load training data
train.subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
colnames(train.subject) <- "subjectId"
xtrain.data <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
colnames(xtrain.data) <- feature
ytrain.data <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
colnames(ytrain.data) <- "activityId"
#load test data
test.subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
colnames(test.subject) <- "subjectId"
xtest.data <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
colnames(xtest.data) <- feature
ytest.data <- read.table("./data/UCI HAR Dataset/test/Y_test.txt", col.names="activityId")
colnames(ytest.data) <- "activityId"

#merge data
test.data <- cbind(test.subject, ytest.data, xtest.data)
train.data <- cbind(train.subject, ytrain.data, xtrain.data)
merge.data <- rbind(train.data, test.data)

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
meanIndex <- grep("mean", names(merge.data), ignore.case = TRUE)
meanName <- names(merge.data)[meanIndex]
stdIndex <- grep("std", names(merge.data), ignore.case = TRUE)
stdName <- names(merge.data)[stdIndex]
meanNstd <- merge.data[,c("subjectId", "activityId", meanName, stdName)]

#3.Uses descriptive activity names to name the activities in the data set
descriptiveName <- merge(activity, meanNstd, by.x = "activityId", by.y = "activityId", all = TRUE)

#4.Appropriately labels the data set with descriptive variable names. 
melt.data <- melt(descriptiveName, id = c("activityId", "activityName", "subjectId"))
mean.data <- dcast(melt.data, activityId + activityName + subjectId ~ variable, mean)

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(mean.data, "./tidyData.txt", row.name = FALSE, sep = "\t")