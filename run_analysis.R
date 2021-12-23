# preload the library

library(tidyr)
library(dplyr)
library(data.table)
library(stringr)



##-----------------------------------------------------------------------------
## Function defination
## get_merged_data(n_sample=10， is_DEBUG=FALSE)
## get_descriptive_name(df)
## save_average_result(average_df)
##-----------------------------------------------------------------------------
get_merged_data<- function(n_sample=10, is_DEBUG=FALSE) {
  # n_sample  # set to 10 for read 10rows as sample perfile while developing and
  # debugging period.
  # step 1. download and decompress the data
  
  target_file = file.path('data','datasets.zip')
  if (!file.exists(target_file)){
    url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    
    download.file(url,target_file)
    date_downloaded <- date()
    print(paste('Downloaded timestamp: ',date_downloaded))
    print(paste("Unzipping the ", target_file,"...->"))
    
    print(unzip_list)
    unzip(target_file, exdir='data')
    print("unzip finished")
  }

  # step 2 load feature, activities data. It will be used by X, Y datasets at 
  #        following steps. 
  features <- fread("data/UCI HAR Dataset/features.txt", 
                    col.names = c("feature_id","feature_name"), 
                    nrows =Inf)
  activities <- fread("data/UCI HAR Dataset/activity_labels.txt", 
                      col.names = c("label", "activity_name"), 
                      nrows =Inf)
  
  # step 3 load subject, X, Y datasets from train and test folders and merged 
  #        separately.
  ## step 3.1 load & merge subject dataset
  subject_train_dt <- fread("data/UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "subject_id", 
                            nrows =n_sample)
  subject_test_dt <- fread("data/UCI HAR Dataset/test/subject_test.txt", 
                           col.names = "subject_id", 
                           nrows =n_sample)
  subject_dt <- rbind(subject_train_dt, 
                      subject_test_dt
                      )
  
  # step 3.2 load and merge X dataset. 
  ## While fread the txt, the x dataset columns name was renamed with 
  ## feature_name according to feature dataset.
  x_train_dt <- fread("data/UCI HAR Dataset/train/X_train.txt", 
                      col.names = features$feature_name, 
                      nrows =n_sample)
  x_test_dt <- fread("data/UCI HAR Dataset/test/X_test.txt", 
                     col.names = features$feature_name, 
                     nrows =n_sample)
  x_dt <- rbind(x_train_dt, x_test_dt) 
  
  
  # step 3.3 load and merge Y dataset
  ## the activity names was added accouring to the label in activities dataset. 
  y_train_dt <- fread("data/UCI HAR Dataset/train/y_train.txt", 
                      col.names = "label", 
                      nrows =n_sample)
  y_test_dt <- fread("data/UCI HAR Dataset/test/y_test.txt", 
                     col.names = "label", nrows =n_sample)
  y_dt <- rbind(y_train_dt, y_test_dt) %>% inner_join(activities,by='label') 

  # step 4 combine Subject, Y, and X dataset together into all in one 
  #        combined dataset
  combined_dt <- cbind(subject_dt, y_dt, x_dt)
  
  combined_dt
}

# get_descriptive_df function purpose is to create description varaible vector
## input  : data.frame or data.table which generated from get_combined_data
## output  : a descriptive character vector which easy to understand and no 
##           abbreviation
## process : using pipeline to translate abbreviation to full description.
get_descriptive_name<- function(df){
  
  # Do nothing at begining
  abbreviate_name <- names(df)
  # descriptiive task list
  descriptive_name <- abbreviate_name %>%
    gsub(pattern="^t", replacement="Time") %>%
    gsub(pattern="^f", replacement="Frequency") %>%
    gsub(pattern="tBody", replacement="TimeBody") %>%
    gsub(pattern="fBody", replacement="FrequencyBody") %>%
    gsub(pattern="-mean\\(\\)", replacement="Mean") %>%
    gsub(pattern="-std\\(\\)", replacement="STD") %>%
    gsub(pattern="Freq\\(\\)", replacement="Frequency") %>%
    gsub(pattern="Acc", replacement="Accelerometer") %>%
    gsub(pattern="BodyBody", replacement="Body") %>%
    gsub(pattern="Gyro", replacement="Gyroscope") %>%
    gsub(pattern="Mag", replacement="Magnitude") %>%
    gsub(pattern="gravity", replacement="Gravity")
  
  # below code for angle of two vectors variable only.
  # it should be process at end of descriptive process.
  descriptive_name <- descriptive_name %>%
    gsub(pattern=",", replacement="") %>%  
    gsub(pattern="\\)", replacement="") 
    
  descriptive_name
}

# save the result of average of variable based on group of subjects, activities
# separately
save_average_result<-function(average_df){
  export_path = "data/UCI HAR Dataset/merged"
  average_measurement_basename = 'average_measurement.txt'
  
  if (!dir.exists(export_path)){
    dir.create(export_path,recursive = TRUE)
  }
  
  average_measurement_pathname = file.path(export_path,
                                           average_measurement_basename
  )
  average_df %>% write.table(average_measurement_pathname,
                               row.name=FALSE)
}

##==============================================================================
## main part
##==============================================================================

# 1. Merges the training and the test sets to create one data set.
## by sef defined function get_merged_data()
combined_dt <- get_merged_data(n_sample = Inf)

# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
filtered_dt <- combined_dt %>% 
  select(subject_id, label,activity_name, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set
# it has been completed in get_merged_data process. 
# the filtered_dt$activity_name is the activity name.

original_name <- names(filtered_dt)
## 4. Appropriately labels the data set with descriptive variable names. 
# do it by define get_descriptive_name, apply the function to names(filtered_dt)
descriptive_name <- filtered_dt %>% get_descriptive_name()
names(filtered_dt) <-descriptive_name
# code_book <- cbind(descriptive_name,'meaning of',original_name) 
# code_book %>%fwrite('code_book.txt')

## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
## 5.1 average of activity
average_df <- filtered_dt %>% 
  select(-label)%>%
  group_by(subject_id,activity_name) %>% 
  summarise_all(.funs=mean)

print(dim(filtered_dt))

## 6 save average result of activities, subjects

save_average_result(average_df)