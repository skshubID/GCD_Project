#COURSERA
##Getting and Cleaning Data

###Course Project
*Create a 'Tidy Dataset' using raw data collected from the accelerometers from the Samsung Galaxy S smartphone.*

**Data Description**
For each record in the dataset, following information is provided:
 1. Triaxial acceleration from the accelerometer (total acceleration) and
   the estimated body acceleration.
 2. Triaxial Angular velocity from the gyroscope.
 3. A 561-feature vector with time and frequency domain variables.
 4. Its activity label.
 5.  An identifier of the subject who carried out the experiment.

**Activity Labels**
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

**Identifiers**
Subject
Activity

**READ Files**
FEATURES
"./data/features.txt"
ACTIVITY LABELS
"./data/activity_labels.txt"
TRAINING DATA
"./data/train/subject_train.txt"
"./data/train/X_train.txt"
"./data/train/y_train.txt"
TEST DATA
"./data/test/subject_test.txt"
"./data/test/X_test.txt"
"./data/test/y_test.txt"

**Data Cleanup Steps**

 1. Merge training and test data
 2. Use labels from Features
 3. Take a subset of Mean and Std.Dev. fro each measurement
 4. Use activity names and merge with data
 5. Summarize data and write out file