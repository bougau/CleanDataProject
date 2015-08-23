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


## Script Variables

* subjects: data table containing the combined test and train list of subjects

* X: data set containing the combined test and train readings

* Y: data set containing the combined test and train activities

* ds: data set containing the combined subject, activity and readings for means and standard deviations

* gds: data set grouped subject activities and the means of the readings for each.

