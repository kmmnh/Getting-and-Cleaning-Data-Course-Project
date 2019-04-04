#Download file to computer

> if (!file.exists("week4CourseProject")) {dir.create("week4CourseProject")}
> url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
> download.file(url,destfile = "./week4CourseProject/dataset.zip")
trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Content type 'application/zip' length 62556944 bytes (59.7 MB)
downloaded 59.7 MB

#Unzip data files

> unzip(zipfile = "./week4CourseProject/dataset.zip", exdir = "./week4CourseProject")
> file_path <- file.path("./week4CourseProject" , "UCI HAR Dataset")
> files <- list.files(file_path, recursive = TRUE)


> files
[1] "activity_labels.txt"                          "features.txt"                                 "features_info.txt"                            "README.txt"                                  
[5] "test/Inertial Signals/body_acc_x_test.txt"    "test/Inertial Signals/body_acc_y_test.txt"    "test/Inertial Signals/body_acc_z_test.txt"    "test/Inertial Signals/body_gyro_x_test.txt"  
[9] "test/Inertial Signals/body_gyro_y_test.txt"   "test/Inertial Signals/body_gyro_z_test.txt"   "test/Inertial Signals/total_acc_x_test.txt"   "test/Inertial Signals/total_acc_y_test.txt"  
[13] "test/Inertial Signals/total_acc_z_test.txt"   "test/subject_test.txt"                        "test/X_test.txt"                              "test/y_test.txt"                             
[17] "train/Inertial Signals/body_acc_x_train.txt"  "train/Inertial Signals/body_acc_y_train.txt"  "train/Inertial Signals/body_acc_z_train.txt"  "train/Inertial Signals/body_gyro_x_train.txt"
[21] "train/Inertial Signals/body_gyro_y_train.txt" "train/Inertial Signals/body_gyro_z_train.txt" "train/Inertial Signals/total_acc_x_train.txt" "train/Inertial Signals/total_acc_y_train.txt"
[25] "train/Inertial Signals/total_acc_z_train.txt" "train/subject_train.txt"                      "train/X_train.txt"                            "train/y_train.txt"                           


#Read the files UCI HAR Dataset and create data tables for Activity, Subject and Feature*



> activityTESTdata <- read.table(file.path(file_path, "test", "Y_test.txt"), header = FALSE)

> activityTRAINdata <- read.table(file.path(file_path, "train", "Y_train.txt"), header = FALSE)

> subjectTESTdata <- read.table(file.path(file_path, "test", "subject_test.txt"), header = FALSE)

> subjectTRAINdata <- read.table(file.path(file_path, "train", "subject_train.txt"), header = FALSE)

> featuresTRAINdata <- read.table(file.path(file_path, "train", "X_train.txt"), header = FALSE)

> featuresTESTdata <- read.table(file.path(file_path, "test", "X_test.txt"), header = FALSE)


#1.Merges the training and the test sets to create one data set.**



> SubjectData <- rbind(subjectTRAINdata, subjectTESTdata)

> ActivityData <- rbind (activityTESTdata, activityTRAINdata)

> FeaturesData <- rbind (featuresTRAINdata, featuresTESTdata)


> names(SubjectData) <- c("Subject")
> names(ActivityData) <- c("Activity")

> FeaturesDataName <- read.table(file.path(file_path,"features.txt"), head=FALSE)
> names(FeaturesData) <- FeaturesDataName$V2

> CombineDataset <- cbind(SubjectData, ActivityData)
> CombineDataset2 <- cbind(FeaturesData, CombineDataset)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.


columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(CombineDataset2), ignore.case=TRUE)

> dim(CombineDataset2)
[1] 10299    68



#3.Uses descriptive activity names to name the activities in the dataset**


> CombineDataset2$Activity <- as.character(CombineDataset2$Activity)
> for (i in 1:6){
  + CombineDataset2$Activity[CombineDataset2$Activity == i] <- as.character(ActivityLabels[i,2])
  + }

> CombineDataset2$Activity <- as.factor(CombineDataset2$Activity)

> names(CombineDataset2)
[1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"       
[8] "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[15] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"         
[22] "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"          "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"     
[36] "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"      "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
[50] "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"        "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"    
[64] "fBodyBodyGyroMag-std()"      "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"  "Subject"                     "Activity"                   




#4.Appropriately labels the data set with descriptive variable names.**

> names(CombineDataset2)<-gsub("Acc", "Accelerometer", names(CombineDataset2))
> names(CombineDataset2)<-gsub("Gyro", "Gyroscope", names(CombineDataset2))
> names(CombineDataset2)<-gsub("BodyBody", "Body", names(CombineDataset2))
> names(CombineDataset2)<-gsub("Mag", "Magnitude", names(CombineDataset2))
> names(CombineDataset2)<-gsub("^t", "Time", names(CombineDataset2))
> names(CombineDataset2)<-gsub("^f", "Frequency", names(CombineDataset2))
> names(CombineDataset2)<-gsub("tBody", "TimeBody", names(CombineDataset2))
> names(CombineDataset2)<-gsub("-mean()", "Mean", names(CombineDataset2), ignore.case = TRUE)
> names(CombineDataset2)<-gsub("-std()", "STD", names(CombineDataset2), ignore.case = TRUE)
> names(CombineDataset2)<-gsub("-freq()", "Frequency", names(CombineDataset2), ignore.case = TRUE)
> names(CombineDataset2)<-gsub("angle", "Angle", names(CombineDataset2))
> names(CombineDataset2)<-gsub("gravity", "Gravity", names(CombineDataset2))
> 
  names(CombineDataset2)
[1] "TimeBodyAccelerometerMean()-X"                 "TimeBodyAccelerometerMean()-Y"                 "TimeBodyAccelerometerMean()-Z"                 "TimeBodyAccelerometerSTD()-X"                 
[5] "TimeBodyAccelerometerSTD()-Y"                  "TimeBodyAccelerometerSTD()-Z"                  "TimeGravityAccelerometerMean()-X"              "TimeGravityAccelerometerMean()-Y"             
[9] "TimeGravityAccelerometerMean()-Z"              "TimeGravityAccelerometerSTD()-X"               "TimeGravityAccelerometerSTD()-Y"               "TimeGravityAccelerometerSTD()-Z"              
[13] "TimeBodyAccelerometerJerkMean()-X"             "TimeBodyAccelerometerJerkMean()-Y"             "TimeBodyAccelerometerJerkMean()-Z"             "TimeBodyAccelerometerJerkSTD()-X"             
[17] "TimeBodyAccelerometerJerkSTD()-Y"              "TimeBodyAccelerometerJerkSTD()-Z"              "TimeBodyGyroscopeMean()-X"                     "TimeBodyGyroscopeMean()-Y"                    
[21] "TimeBodyGyroscopeMean()-Z"                     "TimeBodyGyroscopeSTD()-X"                      "TimeBodyGyroscopeSTD()-Y"                      "TimeBodyGyroscopeSTD()-Z"                     
[25] "TimeBodyGyroscopeJerkMean()-X"                 "TimeBodyGyroscopeJerkMean()-Y"                 "TimeBodyGyroscopeJerkMean()-Z"                 "TimeBodyGyroscopeJerkSTD()-X"                 
[29] "TimeBodyGyroscopeJerkSTD()-Y"                  "TimeBodyGyroscopeJerkSTD()-Z"                  "TimeBodyAccelerometerMagnitudeMean()"          "TimeBodyAccelerometerMagnitudeSTD()"          
[33] "TimeGravityAccelerometerMagnitudeMean()"       "TimeGravityAccelerometerMagnitudeSTD()"        "TimeBodyAccelerometerJerkMagnitudeMean()"      "TimeBodyAccelerometerJerkMagnitudeSTD()"      
[37] "TimeBodyGyroscopeMagnitudeMean()"              "TimeBodyGyroscopeMagnitudeSTD()"               "TimeBodyGyroscopeJerkMagnitudeMean()"          "TimeBodyGyroscopeJerkMagnitudeSTD()"          
[41] "FrequencyBodyAccelerometerMean()-X"            "FrequencyBodyAccelerometerMean()-Y"            "FrequencyBodyAccelerometerMean()-Z"            "FrequencyBodyAccelerometerSTD()-X"            
[45] "FrequencyBodyAccelerometerSTD()-Y"             "FrequencyBodyAccelerometerSTD()-Z"             "FrequencyBodyAccelerometerJerkMean()-X"        "FrequencyBodyAccelerometerJerkMean()-Y"       
[49] "FrequencyBodyAccelerometerJerkMean()-Z"        "FrequencyBodyAccelerometerJerkSTD()-X"         "FrequencyBodyAccelerometerJerkSTD()-Y"         "FrequencyBodyAccelerometerJerkSTD()-Z"        
[53] "FrequencyBodyGyroscopeMean()-X"                "FrequencyBodyGyroscopeMean()-Y"                "FrequencyBodyGyroscopeMean()-Z"                "FrequencyBodyGyroscopeSTD()-X"                
[57] "FrequencyBodyGyroscopeSTD()-Y"                 "FrequencyBodyGyroscopeSTD()-Z"                 "FrequencyBodyAccelerometerMagnitudeMean()"     "FrequencyBodyAccelerometerMagnitudeSTD()"     
[61] "FrequencyBodyAccelerometerJerkMagnitudeMean()" "FrequencyBodyAccelerometerJerkMagnitudeSTD()"  "FrequencyBodyGyroscopeMagnitudeMean()"         "FrequencyBodyGyroscopeMagnitudeSTD()"         
[65] "FrequencyBodyGyroscopeJerkMagnitudeMean()"     "FrequencyBodyGyroscopeJerkMagnitudeSTD()"      "Subject"                                       "Activity"                                     


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**


> CombineDataset2$Subject <- as.factor(CombineDataset2$Subject)

> CombinDataset2 <- data.table(CombineDataset2)