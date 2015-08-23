library(dplyr)

##
## Create merged set of data tables
##
## merge subject files
##
subject_test_file <- "./UCI-HAR-Dataset/test/subject_test.txt"
subject_test <- read.table(subject_test_file)

subject_train_file <- "./UCI-HAR-Dataset/train/subject_train.txt"
subject_train <- read.table(subject_train_file)

subjects <- rbind(subject_test, subject_train)


##
## merge X files
##
X_test_file <- "./UCI-HAR-Dataset/test/X_test.txt"
X_test <- read.table(X_test_file)

X_train_file <- "./UCI-HAR-Dataset/train/X_train.txt"
X_train <- read.table(X_train_file)

X <- rbind(X_test, X_train)

##
## merge Y files
##
Y_test_file <- "./UCI-HAR-Dataset/test/y_test.txt"
Y_test <- read.table(Y_test_file)

Y_train_file <- "./UCI-HAR-Dataset/train/y_train.txt"
Y_train <- read.table(Y_train_file)

Y <- rbind(Y_test, Y_train)

##
## Set Activity Labels values in Y
##
Y$activity <-ifelse(Y$V1 == 1, "WALKING", ifelse(Y$V1 == 2, "WALKING_UPSTAIRS", ifelse(Y$V1 == 3, "WALKING_DOWNSTAIRS", ifelse(Y$V1 == 4, "SITTING", ifelse(Y$V1 == 5, "STANDING", ifelse(Y$V1 == 6, "LAYING", "UNKNOWN"))))))
activities <- Y$activity

##
## Read Features
##
features_file <- "./UCI-HAR-Dataset/features.txt"
features <- read.table(features_file)
features <- features[,2]
colnames(X) <- features

##
## Set new data set with subject, activity and readings as columns
##

ds <- cbind("Subject"=subjects[,1],"Activity"=Y$activity,X[,grepl("(-mean)|(-std)", names(X))])

##
## sort by subject and activity
##

ds <- arrange(ds, Subject, Activity)

gds <- ds %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

## 
## Write gds into txt file
##
write_table(gds, file = "CleaningDataProject.txt", row.name=FALSE)




