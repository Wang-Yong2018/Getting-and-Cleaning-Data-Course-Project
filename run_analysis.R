# preload the library
library(tidyr)
library(dplyr)

# download the data

url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
target_file = file.path('data','datasets.zip')

if (file.exists(target_file)){
  #download.file(url,target_file)
  date_downloaded <- date()
  print(paste('Downloaded timestamp: ',date_downloaded))
  print(paste("Unzipping the ", target_file,"...->"))
  unzip_list <- unzip(target_file, exdir='data',list=TRUE)%>% as_tibble()
  print(unzip_list)
  unzip(target_file, exdir='data')
  print("unzip finished")
}


# load the data

# Run & Analyze 
## 1.Merges the training and the test sets to create one data set.

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

## 3. Uses descriptive activity names to name the activities in the data set

## 4. Appropriately labels the data set with descriptive variable names. 

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.