# Cleaning Data Project Data Set

Author:		BouGau
Date:		August 22, 2015
File: 		CleaningDataProject.txt

## Data Set Description

The source of this tidy data set was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and manipulated to combine test and train data, subjects, activity values and grouped to extract the mean of readings by subject and activity.

## Variables

## Subjects

Subjects are numeric values identifying subjects from the test and train files

## Activities

Activities are the text values converted from the code values in the raw files.   The code values were converted as follows:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING 

## Variables

Readings from the raw files (X files) were filtered to extract only readings with "-mean" and "-std" in the name.  The resulting readings are means of the filtered readings grouped by subject and activities. 
