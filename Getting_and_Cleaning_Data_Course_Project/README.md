## Peer-graded Assignment: Getting and Cleaning Data Course Project

**Getting and Cleaning Data Course Projectless:**

You should create one R script called run_analysis.R that does the following.

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Here are the steps that must be performed before running the R script:**

1. Check for the Librearys reshape2 and data.table if they are not exist then install. 
2. Download the zip file from [this URL](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
3. Unzip the file.
4. Then set it as your working directory using setwd()function in RStudio.
5. Please "run_analysis.R" in same directory.
5. Run source("run_analysis.R"), then it will generate a new file tiny.txt in your working directory.