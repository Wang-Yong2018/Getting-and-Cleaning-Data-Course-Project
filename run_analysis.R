# preload the library
library(tidyr)
library(dplyr)
library(data.table)
library(stringr)

# download the data
url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
target_file = file.path('data','datasets.zip')
is_DEBUG = FALSE
sample_n = 10

if (!file.exists(target_file)){
  download.file(url,target_file)
  date_downloaded <- date()
  print(paste('Downloaded timestamp: ',date_downloaded))
  print(paste("Unzipping the ", target_file,"...->"))
  
  print(unzip_list)
  unzip(target_file, exdir='data')
  print("unzip finished")
}


# make merged_file name list
unzip_list <- unzip(target_file, exdir='data',list=TRUE) %>% 
  select(Name, Length) %>%
  mutate(
    Name=file.path('data',Name),
    need_merged=grepl('train.txt|test.txt',Name), 
         merged_type=str_extract(Name,'train.txt|test.txt'),
         merged_name=sub('(_train)|(_test)','_merged',basename(Name))
         ) %>% 
  filter(need_merged) %>%
  pivot_wider(merged_name,names_from=merged_type,values_from=Name)
  



# Run & Analyze 
## 1.Merges the training and the test sets to create one data set.
print("--------Start Merging traing and test file into merged files")
for ( file_id  in seq(dim(unzip_list)[1])) {
  #for ( file_id  in seq(5)) {
  merged_path = 'merged'
  if (!dir.exists(merged_path)) {
    dir.create(merged_path)
  }
  test_file_name <- unzip_list[[file_id,2]]
  train_file_name <- unzip_list[[file_id,3]]
  dirname(train_file_name)
  merged_path = sub('train',
                    'merged',
                    substr(dirname(train_file_name),6,nchar(train_file_name)),
  )
  print(merged_path)
  merged_file_name <- file.path('merged',merged_path,
                                unzip_list[[file_id,1]]
  )
  if (is_DEBUG){
    message <- paste(merged_file_name,'from',train_file_name,'-',test_file_name)
  } else {
    message <- paste(merged_file_name)
  }
  
  #load train & test dataset, and create new column ds_type
  ## 1 for train dataset,
  ## 2 for test dataset
  train_dt <- fread(train_file_name, nrow=sample_n) %>%
    mutate(ds_type=1, id=row_number())
  test_dt <- fread(test_file_name, nrow=sample_n) %>%
    mutate(ds_type=2, id=row_number())
  target_dir = dirname(merged_file_name)
  if(!dir.exists(target_dir)){
    dir.create(target_dir,recursive = TRUE)
  }
  rbind(train_dt,test_dt) %>% fwrite(merged_file_name)
  
  print(message)
}

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# - what is the measurement observersion, mean, std

## 3. Uses descriptive activity names to name the activities in the data set
# - what is the activity name descriptive
## 4. Appropriately labels the data set with descriptive variable names. 
# - what is the appropriately name

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# average of activity
# average of subject