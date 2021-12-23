Getting-and-Cleaning-Data-Assignment

# Summery
About this repository
This repository was created for the peer-graded assignment of:
Course 3: Getting And Cleaning Data, from Data Science Specialization, by Johns 
          Hopkins University, on coursera The course is taught by:
Jeff Leek, Phd
Roger D. Peng, Phd
Brian Caffo, Phd

The purpose of the assignment is to demonstrate your ability to collect, work 
  with, and clean a data set. 

The goal is to prepare tidy data that can be used for later analysis.

The assignment asked to:
- a **tidy data set** as described below
- a link to a Github repository with your **script** for performing the analysis, and
- a **code book** that describes the variables, the data, and any transformations 
    or work that you performed to clean up the data called **CodeBook.md**.

You should also include a README.md in the repo with your scripts. This repo 
explains how all of the scripts work and how they are connected.

# desired input and output
## input <- url as below
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## output -> tidy dataset 
- average_measurement.txt

  independent tidy data set with the average of each variable for each activity 
  and each subject

## script
- run_analysis.R

# How TO
## basic
1. run script at Rstudio
  the script name is run_analysis.R
2. check the output at current folder
  the tidy dataset is 'data/UCI HAR Dataset/merged/average_measurement.txt'

## inside of run_analysis.R
run_analysis.R collect and clean data in 6 steps. below is detail inside data 
pipeline for your refernce

1. Merging. 
Merges the training and the test sets to create one data set by self defined 
function get_merged_data(). The get_merged_data include 6 steps to get and clean data
> combined_dt <- get_merged_data()

2. Extracting.
Extracts only the measurements on the mean and standard deviation for each measurement. 
> filtered_dt <- combined_dt %>% 
>  select(subject_id, label,activity_name, contains("mean"), contains("std"))

3. Uses descriptive activity names to name the activities in the data set
 it has been completed in get_merged_data process. 
 the filtered_dt$activity_name is the activity name.


4. Appropriately labels the data set with descriptive variable names. 
 do it by define get_descriptive_name, apply the function to names(filtered_dt)
> names(filtered_dt) <- filtered_dt %>% get_descriptive_name()


5. From the data set in step 4, creates a second, independent tidy data set 
  with the average of each variable for each activity and each subject.
5.1 average of activity
> activities_avg <- filtered_dt %>% 
>  select(-subject_id, -label)%>%
>  group_by(activity_name) %>% 
>  summarise_all(.funs=mean)

5.2 average of subject
> subjects_avg <- filtered_dt %>% 
>  select(-label,-activity_name)%>%
>  group_by(subject_id) %>% 
>  summarise_all(.funs=mean)

6 save average result of activities, subjects
> save_average_results(activities_avg, subjects_avg)




# tested environment

> sessionInfo()
R version 4.1.2 (2021-11-01)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19044)