#Getting and Cleaning Data Project

**by Nikos Kouvoutsakis**

###Description

Code book that describes the variables, the data, and any transformations or work that has been performed to clean up the data for the Johns Hopkins Getting and Cleaning Data course Project.

###Source Data origin

####Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Source Data Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Attribute Information

####For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.



####Section 1. Downloading and unziping the data into working directory.

#####The dataset includes the following files:

README.txt

features_info.txt: Shows information about the variables used on the feature vector.

features.txt: List of all features.

activity_labels.txt: Links the class labels with their activity name.

train/X_train.txt: Training set.

train/y_train.txt: Training labels.

test/X_test.txt: Test set.

test/y_test.txt: Test labels.

####Section 2.  Reading the source files into tables

* features			<-features.txt
* activitytype		<-activity_labels.txt
* subjecttrain		<-subject_train.txt
* xtrain			<-x_train.txt
* ytrain			<-y_train.txt
* subjecttest			<-subject_test.txt
* xtest				<-x_test.txt
* ytest				<-y_test.txt

####Section 3. Assign column names and merge trainingdata and testdata to create one data set (finalData).


####Section 4. Extract only the measurements on the mean and standard deviation for each measurement.

Create a logical Vector that contains TRUE values for the subjectID, activityType,activityID, mean and stdev columns and FALSE values for the others. Subsetting the merged data (finalData) with this logical vector to keep only the necessary columns.

####Section 5. Use descriptive activity names to name the activities in the data set

Merged finalData table with the activitytype table to include the descriptive activity names

####Section 6. Appropriately labels the data set with descriptive variable names

Used gsub function with metacharacters.

####Section 7. Created a second, independent tidy data set with the average of each variable for each activity and each subject.
