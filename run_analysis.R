# preload the library
library(tidyr)
library(dplyr)

# download the data

url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
target_file = file.path('data','datasets.zip')

if (!file.exists(target_file)){
  download.file(url,target_file)
  date_downloaded <- date()
  print(paste('Downloaded timestamp: ',date_downloaded))
  print(paste("Unzipping the ", target_file,"...->"))
  unzip_list <- unzip(target_file, exdir='data',list=TRUE)%>% as_tibble()
  print(unzip_list)
  unzip(target_file, exdir='data')
  print("unzip finished")
}


# load the data
for (ds_name in c('train','test')) {
  data_folder = "data"
  zipped_folder = "UCI HAR Dataset"
  ds_folder = ds_name
  file_name = paste('X_',ds_name,'.txt',sep='')
  file_name = file.path(data_folder,zipped_folder,ds_folder,file_name)
  print(file_name)
  print(read.table(file_name, nrows=3) %>% head())
}



# Run & Analyze 
## 1.Merges the training and the test sets to create one data set.


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

## 3. Uses descriptive activity names to name the activities in the data set

## 4. Appropriately labels the data set with descriptive variable names. 

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.