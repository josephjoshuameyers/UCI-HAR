#Codebook

This codebook explains the tidy dataset located at https://github.com/josephjoshuameyers/uci-har-data with the file name:

uci_har_dataset_tidy.txt

From the dataset documentation:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

Check https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for further details about this dataset, how the experiment was set up, etc.

## Raw dataset variables

The complete, raw dataset summarizes the means and standard deviations for the acceleration signals from the smartphone accelerometer X axis in standard gravity units 'g' for the X, Y, and Z axes.

Body linear acceleration and angular velocity were derived in time to obtain Jerk signals, which are included in the tidy dataset.

The dataset includes a total of 561 different variables for each test, including tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, and fBodyGyroJerkMag, each of which are broken down into a mean, std, mad, max, min, sma, energy, iqr, entropy, arCoeff, correlation, maxInds, meanFreq, skewness, kurtosis, bandsEnergy, and angle (which includes gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, and tBodyGyroJerkMean.

## Tidy dataset variables

The provenance of many (but not all) of these variables can be found in the raw dataset documentation at the URL given above. The researchers have kindly included two files:

"features_info.txt": Breaks down the 17 categories into which all 561 variables fall, and lists the functions of each value for each test as described above.

"README.txt": Explains the derivation of the values from the accelerometer, and in which file the test and training values can be found.

The tidy dataset distills ONLY the mean and standard deviation variables, including the derived Jerk variables described above, which are relatively small in number and can be discarded if they are not germaine to the analysis.

For each subject, many measurements were taken for each of the relevant (included) mean and std variables. In re-casting the molten dataset, the means for each mean (SEE NOTE AT BOTTOM) and std were written into the tidy dataset.

There are a total of 81 variables in the tidy dataset:

"subject" -- numeric value in range 1:30, denoting which human subject was tested

"activity_id" -- describes the activity (keyed to the an activity number) in one of six categories: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Some (but, again, not all) of the other 79 variables are described briefly in the documentation that accompanies the dataset, and at the URL given above:

"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-mean()"
"tBodyAccMag-std()"
"tGravityAccMag-mean()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
"fBodyAcc-meanFreq()-X"
"fBodyAcc-meanFreq()-Y"
"fBodyAcc-meanFreq()-Z"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
"fBodyAccJerk-meanFreq()-X"
"fBodyAccJerk-meanFreq()-Y"
"fBodyAccJerk-meanFreq()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyGyro-meanFreq()-X"
"fBodyGyro-meanFreq()-Y"
"fBodyGyro-meanFreq()-Z"
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
"fBodyAccMag-meanFreq()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyAccJerkMag-meanFreq()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroMag-meanFreq()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"
"fBodyBodyGyroJerkMag-meanFreq()"

N.b. It should be reiterated that the values in the tidy dataset are means of means, or means of standard deviations. Any conclusions that might otherwise be drawn ought to be tempered with that knowledge.