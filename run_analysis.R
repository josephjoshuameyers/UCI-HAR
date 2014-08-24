## The package "reshape2" is required for melting and (re-)casting.
library("reshape2")
## The package "plyr" is required for joining datasets.
library(plyr)

## INITIAL IMPORT:
# Import both sets of data (test & training) into data frames.
training_dataset <- read.table("train/X_train.txt")
test_dataset <- read.table("test/X_test.txt")

## COLUMN NAMES:
# The file "features.txt" contains the complete list of column names (qty 561).
list_of_all_features <- read.table("features.txt")
colnames(list_of_all_features) <- c("index","feature")
# Create list of column names:
column_names <- as.vector(list_of_all_features$feature)
rm(list_of_all_features) #(no longer needed)
# Add column names to both datasets:
colnames(training_dataset) <- column_names
colnames(test_dataset) <- column_names
rm(column_names) #(no longer needed)

## CREATE TIDY ACTIVITY COLUMNS:
# Import subject and activity columns with rows corresponding to both datasets:
training_activity_ids <- read.table("train/y_train.txt")
test_activity_ids <- read.table("test/y_test.txt")
colnames(training_activity_ids) <- c("activity_id")
colnames(test_activity_ids) <- c("activity_id")

## CREATE TIDY SUBJECT COLUMNS:
training_subjects <- read.table("train/subject_train.txt")
test_subjects <- read.table("test/subject_test.txt")
colnames(training_subjects) <- c("subject")
colnames(test_subjects) <- c("subject")

## COMBINE SUBJECTS & ACTIVITIES WITH DATASETS:
training_dataset <- cbind(training_subjects, training_activity_ids,
                          training_dataset)
test_dataset <- cbind(test_subjects, test_activity_ids, test_dataset)
rm(training_subjects, test_subjects, test_activity_ids, training_activity_ids)
#(no longer needed)

## COMBINE TRAINING & TEST DATASETS:
all_zot_data <- rbind(test_dataset, training_dataset)
rm(test_dataset, training_dataset) #(no longer needed)

## EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STD FOR EACH MEASUREMENT:
# Create a vector of only the relevant column names:
all_column_names <- colnames(all_zot_data)[-c(1:2)]
relevant_column_names <- all_column_names[grep("mean|std", all_column_names)]
# Create a data frame containing only the relevant columns:
relevant_zot_data <- all_zot_data[,c("subject","activity_id",
                                     relevant_column_names)]
rm(all_zot_data, all_column_names, relevant_column_names) #(no longer needed)

## MELT DOWN DATA FRAME:
zot_melt <- melt(relevant_zot_data, id=c("subject","activity_id"))
rm(relevant_zot_data) #(no longer needed)

## RECAST DATA INTO SECOND, INDEPENDENT SECOND, INDEPENDENT TIDY DATA SET:
zot_cast <- dcast(zot_melt, subject + activity_id ~ variable, mean)
# (The following operation was moved to the end of the program in this revision,
# in order to retain the same original activity order as in the UCI HAR dataset:
# WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
# Appropriately label the data set with descriptive variable names:
activity_names <- read.table("activity_labels.txt")
colnames(activity_names) <- c("activity_id","activity_name")
zot_cast <- join(zot_cast, activity_names, type="left")
zot_cast[,2] <- zot_cast[,ncol(zot_cast)]
zot_cast <- zot_cast[,1:ncol(zot_cast)-1]
rm(activity_names)
rm(zot_melt) #(no longer needed)

## WRITE DATA TO FILE:
write.table(zot_cast, "../uci_har_dataset_tidy.txt", row.names = FALSE)
rm(zot_cast)