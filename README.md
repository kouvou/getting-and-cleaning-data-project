#Getting and Cleaning Data Project

**by Nikos Kouvoutsakis**

###Overview

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

###Source Data origin

####Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Important Notice before running This Script

run_analysis.R downloads and extracts the source data in the working directory. plyr package is also required 
so it must be installed if not, before running the script. This script also initially cleans up the workspace.

###Project Summary

The following is a summary description of the project instructions

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Additional Information about data trasformations and the variables is provided in the CodeBook.MD file.

