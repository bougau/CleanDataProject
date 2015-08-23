# Cleaning Data Project

Author:   BouGau
Date:     August 22, 2015

## Project Instructions

This document describes the steps and variables used to complete the Course Project for the Getting and Cleaning Data Course from Johns Hopkins.

The course instructions were to createone R script called run_analysis.R that does the following:
  
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Tidy Script Steps

* Merge the test and train files containing the list of subjects

```{r}
subject_test_file <- "./UCI-HAR-Dataset/test/subject_test.txt"
subject_test <- read.table(subject_test_file)
subject_train_file <- "./UCI-HAR-Dataset/train/subject_train.txt"
subject_train <- read.table(subject_train_file)
subjects <- rbind(subject_test, subject_train)
```

* Merge the test and train files containing the readings (X)
```{r}
X_test_file <- "./UCI-HAR-Dataset/test/X_test.txt"
X_test <- read.table(X_test_file)
X_train_file <- "./UCI-HAR-Dataset/train/X_train.txt"
X_train <- read.table(X_train_file)
X <- rbind(X_test, X_train)
```

* Merge the test and train files containing the activity codes (Y)
```{r}
Y_test_file <- "./UCI-HAR-Dataset/test/y_test.txt"
Y_test <- read.table(Y_test_file)
Y_train_file <- "./UCI-HAR-Dataset/train/y_train.txt"
Y_train <- read.table(Y_train_file)
Y <- rbind(Y_test, Y_train)
```

* Convert the activity codes to the text labels
```{r}
Y$activity <-ifelse(Y$V1 == 1, "WALKING", ifelse(Y$V1 == 2, "WALKING_UPSTAIRS", ifelse(Y$V1 == 3, "WALKING_DOWNSTAIRS", ifelse(Y$V1 == 4, "SITTING", ifelse(Y$V1 == 5, "STANDING", ifelse(Y$V1 == 6, "LAYING", "UNKNOWN"))))))
activities <- Y$activity
```

* Get the column headings for the readings from the features file and update readings data table
```{r}
features_file <- "./UCI-HAR-Dataset/features.txt"
features <- read.table(features_file)
features <- features[,2]
colnames(X) <- features
```

* Combine the into the data set the Subject, Activity and the readings variables  that include the text "-mean" or "-std" for mean and standard deviation.

```{r}
ds <- cbind("Subject"=subjects[,1],"Activity"=Y$activity,X[,grepl("(-mean)|(-std)", names(X))])
```

* Sort the data set by subject and activity
```{r}
ds <- arrange(ds, Subject, Activity)
```

* Group the data set by subject and activity and keep the mean for each group.
```{r}
gds <- ds %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
```

* Output grouped data set to txt file.
```{r}
write_table(gds, file = "CleaningDataProject.txt", row.name=FALSE)
```
