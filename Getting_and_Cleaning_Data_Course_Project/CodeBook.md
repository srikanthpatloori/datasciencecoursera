## Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.


## Used file

* `subject_test.txt`.
* `X_test.txt`.
* `y_test.txt`.

* `subject_train.txt`.
* `X_train.txt`.
* `y_train.txt`.

* `features.txt`.
* `activity_labels.txt`.

More information about the files is available in `README.txt`. More information about the features is available in `features_info.txt`.

## code steps

1. Load subject data of test into subject_test.
2. Load X data of test into X_test.
3. Load y data of test into y_test.
4. Load subject data of train into subject_train.
5. Load X data of train into X_train.
6. Load y data of train into y_train.
7. Load features data from features.
8. Add column names to all required tables. 
9. Merge all tables into one dataset.
10. Extracts only the measurements on the mean and standard.
11. Ensure that we also keep the subjectID and activity columns.
12. Load Requierd columns into Merged_data.
13. Appropriately labels the data set with descriptive activity column names to factor. 
14. Create the tidy data set.
15. write the tidy data set into files.