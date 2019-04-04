
# Getting-and-Cleaning-Data-Course-Project

The Getting and Cleaning Data Course Project Repository contains the following files:

1) README.md file which provides a description of the orginal dataset and how the tidy data set was created.
2) Code Book which describes the data and the transformations done on the data
3) run_analysis.R the script that was used to create the tidy dataset
4) Tidy.txt is the tidy dataset

Dataset:

Human Activity Recognition using Smartphones Dataset (UCI HAR Dataset)

Description of Dataset:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label 
the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was 
selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-
width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and 
gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
frequency was used. From each window, a vector of features was obtained by calculating variables from the time and 
frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Creating the Tidy Dataset.

The run_analysis.R script was created by implementing the following steps:

1) Downloading the necessary files to the computer from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2) Unzipping the files
3) Reading the files from the UCI HAR Dataset and creating tables for Activity, Subject, and Feature
4) Merge the training and tests datasets to create one dataset
5) Extract only the measurements on the mean and standard deviation for each measurement
6) Use descriptive activity names to name the activities in the dataset
7) Appropriately label the data with descriptive variable names
8) Finally, create a tidy dataset with the average of each variable for each activity and each subject
