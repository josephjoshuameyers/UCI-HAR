Getting and Cleaning Data Course Project, 2014.08.24

-----

Enclosed in this repository are an R script and an associated Codebook. The purpose of the script is to clean up the data and produce a tidy data set appropriate for subsequent analysis. The script merges the TEST and TRAINING data sets, extracts only the measurements on the mean and standard deviation for each measurement, replaces the index values with meaningful names for each activity, labels the data set with appropriate variable names, and finally exports (using write.table) an independent tidy data set showing the average of each variable per activity, per subject. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone, and are hosted at the University of California, Irvine.

Further information concerning the script's output can be found in Codebook.md. 

-----

Script information:

1. Load both dependency packages.
2. Load in both data sets into data frames.
3. Assign column names to both data sets.
4. Import subject and activity columns and align to data sets.
5. Tidy up subject columns.
6. Combine subject/activity id columns with both datasets, and then merge the datasets.
7. Extract mean and standard devation measurements, discard others.
8. Melt down data set and recast means of each measurement for each subject.
9. Rename activity id's to meaningful names. (This is done at the end to retain the order activities are listed in original data.)

-----

The original dataset can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

-----

Obligatory licence information: [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012