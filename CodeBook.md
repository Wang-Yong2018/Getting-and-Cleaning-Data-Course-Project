==================================================================
Get and clean data course assignment
According to the assignment requirement collect and clean the data source to tidy data.
input: assigment requirement
output:
  - run_analysis.R
  - CodeBook.md
  - readme

data source name: Human Activity Recognition Using Smartphones Dataset
data source url : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
Version 0.1
==================================================================

# CodeBook
# files
1. activities_average_measurement.txt
independent tidy data set with the average of each variable for each activity
2. subjects_average_measurement.txt
independent tidy data set with the average of each variable for each subject.

# Variables
---------------------------------------------------------------------------------
"descriptive_name"                                    "description"
---------------------------------------------------------------------------------
subject_id                                            The subject identifier of volunteer (1-30)(only in file subjects_average_measurement.txt)                        
label                                                 The label of activity subject performed (1,2,3,4,5,6,) (only in file activities_average_measurement.txt)
activity_name                                         The name of activity subject performed (WALKING ,WALKING_UPSTAIRS ,WALKING_DOWNSTAIRS ,SITTING ,STANDING ,LAYING
) (only in file activities_average_measurement.txt) 

TimeBodyAccelerometerMean-X                           average of tBodyAcc-mean()-X                                    
TimeBodyAccelerometerMean-Y                           average of tBodyAcc-mean()-Y                                    
TimeBodyAccelerometerMean-Z                           average of tBodyAcc-mean()-Z                                    
TimeGravityAccelerometerMean-X                        average of tGravityAcc-mean()-X                                 
TimeGravityAccelerometerMean-Y                        average of tGravityAcc-mean()-Y                                 
TimeGravityAccelerometerMean-Z                        average of tGravityAcc-mean()-Z                                 
TimeBodyAccelerometerJerkMean-X                       average of tBodyAccJerk-mean()-X                                
TimeBodyAccelerometerJerkMean-Y                       average of tBodyAccJerk-mean()-Y                                
TimeBodyAccelerometerJerkMean-Z                       average of tBodyAccJerk-mean()-Z                                
TimeBodyGyroscopeMean-X                               average of tBodyGyro-mean()-X                                   
TimeBodyGyroscopeMean-Y                               average of tBodyGyro-mean()-Y                                   
TimeBodyGyroscopeMean-Z                               average of tBodyGyro-mean()-Z                                   
TimeBodyGyroscopeJerkMean-X                           average of tBodyGyroJerk-mean()-X                               
TimeBodyGyroscopeJerkMean-Y                           average of tBodyGyroJerk-mean()-Y                               
TimeBodyGyroscopeJerkMean-Z                           average of tBodyGyroJerk-mean()-Z                               
TimeBodyAccelerometerMagnitudeMean                    average of tBodyAccMag-mean()                                   
TimeGravityAccelerometerMagnitudeMean                 average of tGravityAccMag-mean()                                
TimeBodyAccelerometerJerkMagnitudeMean                average of tBodyAccJerkMag-mean()                               
TimeBodyGyroscopeMagnitudeMean                        average of tBodyGyroMag-mean()                                  
TimeBodyGyroscopeJerkMagnitudeMean                    average of tBodyGyroJerkMag-mean()                              
FrequencyBodyAccelerometerMean-X                      average of fBodyAcc-mean()-X                                    
FrequencyBodyAccelerometerMean-Y                      average of fBodyAcc-mean()-Y                                    
FrequencyBodyAccelerometerMean-Z                      average of fBodyAcc-mean()-Z                                    
FrequencyBodyAccelerometer-meanFrequency-X            average of fBodyAcc-meanFreq()-X                                
FrequencyBodyAccelerometer-meanFrequency-Y            average of fBodyAcc-meanFreq()-Y                                
FrequencyBodyAccelerometer-meanFrequency-Z            average of fBodyAcc-meanFreq()-Z                                
FrequencyBodyAccelerometerJerkMean-X                  average of fBodyAccJerk-mean()-X                                
FrequencyBodyAccelerometerJerkMean-Y                  average of fBodyAccJerk-mean()-Y                                
FrequencyBodyAccelerometerJerkMean-Z                  average of fBodyAccJerk-mean()-Z                                
FrequencyBodyAccelerometerJerk-meanFrequency-X        average of fBodyAccJerk-meanFreq()-X                            
FrequencyBodyAccelerometerJerk-meanFrequency-Y        average of fBodyAccJerk-meanFreq()-Y                            
FrequencyBodyAccelerometerJerk-meanFrequency-Z        average of fBodyAccJerk-meanFreq()-Z                            
FrequencyBodyGyroscopeMean-X                          average of fBodyGyro-mean()-X                                   
FrequencyBodyGyroscopeMean-Y                          average of fBodyGyro-mean()-Y                                   
FrequencyBodyGyroscopeMean-Z                          average of fBodyGyro-mean()-Z                                   
FrequencyBodyGyroscope-meanFrequency-X                average of fBodyGyro-meanFreq()-X                               
FrequencyBodyGyroscope-meanFrequency-Y                average of fBodyGyro-meanFreq()-Y                               
FrequencyBodyGyroscope-meanFrequency-Z                average of fBodyGyro-meanFreq()-Z                               
FrequencyBodyAccelerometerMagnitudeMean               average of fBodyAccMag-mean()                                   
FrequencyBodyAccelerometerMagnitude-meanFrequency     average of fBodyAccMag-meanFreq()                               
FrequencyBodyAccelerometerJerkMagnitudeMean           average of fBodyBodyAccJerkMag-mean()                           
FrequencyBodyAccelerometerJerkMagnitude-meanFrequency average of fBodyBodyAccJerkMag-meanFreq()                       
FrequencyBodyGyroscopeMagnitudeMean                   average of fBodyBodyGyroMag-mean()                              
FrequencyBodyGyroscopeMagnitude-meanFrequency         average of fBodyBodyGyroMag-meanFreq()                          
FrequencyBodyGyroscopeJerkMagnitudeMean               average of fBodyBodyGyroJerkMag-mean()                          
FrequencyBodyGyroscopeJerkMagnitude-meanFrequency     average of fBodyBodyGyroJerkMag-meanFreq()                      
AngleTimeBodyAccelerometerMeanGravity                 average of angle(tBodyAccMean,gravity)                          
AngleTimeBodyAccelerometerJerkMeanGravityMean         average of angle(tBodyAccJerkMean),gravityMean)                 
AngleTimeBodyGyroscopeMeanGravityMean                 average of angle(tBodyGyroMean,gravityMean)                     
AngleTimeBodyGyroscopeJerkMeanGravityMean             average of angle(tBodyGyroJerkMean,gravityMean)                 
AngleXGravityMean                                     average of angle(X,gravityMean)                                 
AngleYGravityMean                                     average of angle(Y,gravityMean)                                 
AngleZGravityMean                                     average of angle(Z,gravityMean)                                 
TimeBodyAccelerometerSTD-X                            average of tBodyAcc-std()-X                                     
TimeBodyAccelerometerSTD-Y                            average of tBodyAcc-std()-Y                                     
TimeBodyAccelerometerSTD-Z                            average of tBodyAcc-std()-Z                                     
TimeGravityAccelerometerSTD-X                         average of tGravityAcc-std()-X                                  
TimeGravityAccelerometerSTD-Y                         average of tGravityAcc-std()-Y                                  
TimeGravityAccelerometerSTD-Z                         average of tGravityAcc-std()-Z                                  
TimeBodyAccelerometerJerkSTD-X                        average of tBodyAccJerk-std()-X                                 
TimeBodyAccelerometerJerkSTD-Y                        average of tBodyAccJerk-std()-Y                                 
TimeBodyAccelerometerJerkSTD-Z                        average of tBodyAccJerk-std()-Z                                 
TimeBodyGyroscopeSTD-X                                average of tBodyGyro-std()-X                                    
TimeBodyGyroscopeSTD-Y                                average of tBodyGyro-std()-Y                                    
TimeBodyGyroscopeSTD-Z                                average of tBodyGyro-std()-Z                                    
TimeBodyGyroscopeJerkSTD-X                            average of tBodyGyroJerk-std()-X                                
TimeBodyGyroscopeJerkSTD-Y                            average of tBodyGyroJerk-std()-Y                                
TimeBodyGyroscopeJerkSTD-Z                            average of tBodyGyroJerk-std()-Z                                
TimeBodyAccelerometerMagnitudeSTD                     average of tBodyAccMag-std()                                    
TimeGravityAccelerometerMagnitudeSTD                  average of tGravityAccMag-std()                                 
TimeBodyAccelerometerJerkMagnitudeSTD                 average of tBodyAccJerkMag-std()                                
TimeBodyGyroscopeMagnitudeSTD                         average of tBodyGyroMag-std()                                   
TimeBodyGyroscopeJerkMagnitudeSTD                     average of tBodyGyroJerkMag-std()                               
FrequencyBodyAccelerometerSTD-X                       average of fBodyAcc-std()-X                                     
FrequencyBodyAccelerometerSTD-Y                       average of fBodyAcc-std()-Y                                     
FrequencyBodyAccelerometerSTD-Z                       average of fBodyAcc-std()-Z                                     
FrequencyBodyAccelerometerJerkSTD-X                   average of fBodyAccJerk-std()-X                                 
FrequencyBodyAccelerometerJerkSTD-Y                   average of fBodyAccJerk-std()-Y                                 
FrequencyBodyAccelerometerJerkSTD-Z                   average of fBodyAccJerk-std()-Z                                 
FrequencyBodyGyroscopeSTD-X                           average of fBodyGyro-std()-X                                    
FrequencyBodyGyroscopeSTD-Y                           average of fBodyGyro-std()-Y                                    
FrequencyBodyGyroscopeSTD-Z                           average of fBodyGyro-std()-Z                                    
FrequencyBodyAccelerometerMagnitudeSTD                average of fBodyAccMag-std()                                    
FrequencyBodyAccelerometerJerkMagnitudeSTD            average of fBodyBodyAccJerkMag-std()                            
FrequencyBodyGyroscopeMagnitudeSTD                    average of fBodyBodyGyroMag-std()                               
FrequencyBodyGyroscopeJerkMagnitudeSTD                average of fBodyBodyGyroJerkMag-std()                           


## Summary choices
NOT AVAILABLE

## Study design

# 1. Merges the training and the test sets to create one data set.
## by sef defined function get_merged_data()
## the get_merged_data include 6 steps to get and clean data
## data source:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
combined_dt <- get_merged_data()

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
filtered_dt <- combined_dt %>% 
  select(subject_id, label,activity_name, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set
# it has been completed in get_merged_data process. 
# the filtered_dt$activity_name is the activity name.


## 4. Appropriately labels the data set with descriptive variable names. 
# do it by define get_descriptive_name, apply the function to names(filtered_dt)
names(filtered_dt) <- filtered_dt %>% get_descriptive_name()


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## 5.1 average of activity
activities_avg <- filtered_dt %>% 
  select(-subject_id, -label)%>%
  group_by(activity_name) %>% 
  summarise_all(.funs=mean)

## 5.2 average of subject
subjects_avg <- filtered_dt %>% 
  select(-label,-activity_name)%>%
  group_by(subject_id) %>% 
  summarise_all(.funs=mean)

## 6 save average result of activities, subjects
save_average_results(activities_avg, subjects_avg)

Notes:
3. There must a a section called "code book" that describes each variables and ites unites.