# Clean up workspace
rm(list=ls())

#Load the plyr package used for creating the final tidy dataset
library(plyr)

## Download and unzip the source dataset into working directory in case it doesn't exists
if(!file.exists("dataset.zip")){
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "dataset.zip")}
if(!file.exists("UCI HAR Dataset")){
unzip("dataset.zip")}

# Read in the data from files and assign column names
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
subjecttrain = read.table("./UCI HAR Dataset/train/subject_train.txt")
activitytype = read.table("./UCI HAR Dataset/activity_labels.txt")

colnames(activitytype)  = c('activityID','activityType');
colnames(subjecttrain)  = "subjectID";
colnames(xtrain)        = features[,2]; 
colnames(ytrain)        = "activityID";

#Create the final training data table by merging ytrain,subjecttrain,xtrain tables
trainingData = cbind(ytrain,subjecttrain,xtrain);

# Read in the test data from files and assign column names
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest = read.table("./UCI HAR Dataset/test/subject_test.txt")

colnames(subjecttest) = "subjectID";
colnames(xtest)       = features[,2]; 
colnames(ytest)       = "activityID";

#Create the final test data table by merging ytest,subjecttest,xtest tables
testData = cbind(ytest,subjecttest,xtest);

# Combine training and test data to create a final data set
finalData = rbind(trainingData,testData)

# Create a vector for the column names from the finalData
colNames  = colnames(finalData)

#Create a logical Vector that contains TRUE values for the subjectID, activityType,
#activityID, mean and stdev columns and FALSE values for the others. 
logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-[Mm][Ee][Aa][Nn]\\(",colNames) | grepl("-[Ss][Tt][Dd](.*)",colNames))

#Subsetting the merged data (finalData) with this logical vector to keep only 
#the necessary columns.
finalData = finalData[logicalVector==TRUE]

#Merge finalData table with the activitytype table to include the descriptive activity names
finalData = merge(activitytype,finalData,by='activityID',all.x=TRUE)

#Remove the activityID column from finalData table
finalData <- subset( finalData, select =  -activityID )

#Appropriately labels in finalData table with descriptive variable names
names(finalData)<-gsub("^t", "Time", names(finalData))
names(finalData)<-gsub("Acc", "Accelerometer", names(finalData))
names(finalData)<-gsub("Gyro|gyro", "Gyroscope", names(finalData))
names(finalData)<-gsub("Mag", "Magnitude", names(finalData))
names(finalData)<-gsub("BodyBody|body", "Body", names(finalData))
names(finalData)<-gsub("-[Mm]ean", "Mean", names(finalData))
names(finalData)<-gsub("-[Ss]td", "StDev", names(finalData))
names(finalData)<-gsub("^f|[Ff]req", "Frequency",names(finalData))

#Created a second, independent tidy data set with the average of each variable for each activity and each subject
tidydata<-aggregate(. ~activityType+subjectID, finalData, mean)
tidydata<-tidydata[order(tidydata$subjectID,tidydata$activityType),]

#Write tidydata in a txt file in working directory
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)


