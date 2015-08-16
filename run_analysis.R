## Getting and Cleaning Data - Course Project
#USe dplyr package
library(dplyr)

# Set the file names
datafl_features		<- "./data/features.txt"
datafl_activity		<- "./data/activity_labels.txt"
datafile_train_sub 	<- "./data/train/subject_train.txt"
datafile_train_X 		<- "./data/train/X_train.txt"
datafile_train_Y 		<- "./data/train/y_train.txt"
datafile_test_sub 	<- "./data/test/subject_test.txt"
datafile_test_X 		<- "./data/test/X_test.txt"
datafile_test_Y 		<- "./data/test/y_test.txt"

# Read Data
data_features     	<- read.table(datafl_features, 	header=FALSE)
data_activity 		<- read.table(datafl_activity, 	header=FALSE)
data_train_sub 		<- read.table(datafile_train_sub ,	header=FALSE)
data_train_x       	<- read.table(datafile_train_X, 	header=FALSE)
data_train_y       	<- read.table(datafile_train_Y, 	header=FALSE)
data_test_sub 		<- read.table(datafile_test_sub, 	header=FALSE)
data_test_x       	<- read.table(datafile_test_X, 	header=FALSE)
data_test_y       	<- read.table(datafile_test_Y, 	header=FALSE)

#Merge Training and Test data (X values) [[POINT-1]]
merged_x 			<- bind_rows(data_test_x, data_train_x)

# Use data from features.txt for label names
colnames(merged_x) 	<- make.names(data_features$V2, unique = TRUE)

# Subset for Mean and Std Dev for each measurement[[POINT-2]]
merged_x 			<- select(merged_x, 
                      		contains('mean', ignore.case = FALSE), contains('std', ignore.case = FALSE))

# Use activity names with test and training labels
test_labels 		<- left_join(data_test_y, data_activity, by = 'V1')
test_labels 		<- select(test_labels, V2)
train_labels 		<- left_join(data_train_y, data_activity, by = 'V1')
train_labels 		<- select(train_labels, V2)
data_labels 		<- bind_rows(test_labels, train_labels)

colnames(data_labels) 	<- c('Activity')
merged_x 			<- bind_cols(merged_x, data_labels)

# Bind subjects to Merged Data
data_subjects 		<- bind_rows(data_test_sub, data_train_sub)
colnames(data_subjects) <- c('Subject')
merged_x 			<- bind_cols(merged_x, data_subjects)

# Create a summary data set grouped by Subject and Activity
data_summ 			<- group_by(merged_x, Subject, Activity)
data_final	 		<- summarise_each(data_summ, funs(mean))
# Write to the file system
write.table(data_final, 'tidy_data.txt', row.names = FALSE)

