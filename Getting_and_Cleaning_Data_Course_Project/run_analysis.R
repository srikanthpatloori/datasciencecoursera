#Load data into variables as tables.
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#1. Load subject data of test into subject_test.

subject_test <- read.table("test/subject_test.txt")

#2. Load X data of test into X_test

X_test <- read.table("test/X_test.txt")

#3. Load y data of test into y_test

y_test <- read.table("test/y_test.txt")

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#4. Load subject data of train into subject_train.

subject_train <- read.table("train/subject_train.txt")

#5. Load X data of train into X_train

X_train <- read.table("train/X_train.txt")

#6. Load y data of train into y_train

y_train <- read.table("train/y_train.txt")

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#7. Load features data from features.

features <- read.table("features.txt") 

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#8. Add column names to all required tables. 

names(subject_test) <- "subjectID"
names(X_test) <- features$V2
names(y_test) <- "activity"
names(subject_train) <- "subjectID"
names(X_train) <- features$V2
names(y_train) <- "activity"

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#9. Merge all tables into one dataset.

train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
Merged_data <- rbind(train, test)

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#10. Extracts only the measurements on the mean and standard.

meanstd <- grepl("mean\\(\\)", names(Merged_data)) | grepl("std\\(\\)", names(Merged_data))

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#11. Ensure that we also keep the subjectID and activity columns.

meanstd[1:2] <- TRUE

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#12. Load Requierd columns into Merged_data.

Merged_data <- Merged_data[, meanstd]

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#13. Appropriately labels the data set with descriptive activity column names to factor. 

Merged_data$activity <- factor(Merged_data$activity, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#14. Create the tidy data set.
melted <- melt(Merged_data, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#15. write the tidy data set into files.
write.csv(tidy, "tidy.csv", row.names=FALSE)
write.table(tidy, "tidy.txt", row.names=FALSE)
