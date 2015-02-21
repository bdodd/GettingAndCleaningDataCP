Course Project Code Book - Samsung Activity Data

Cleaning up the data
==================================================================
For this project I changed the original data sets in the following ways:
- Imported the original data<br/>
- Added the column names to make the "x data" data more informative from the "features.txt" file <br/>
- Removed columns where the column name did not contain the word "mean" or "std".  I am not familiar enough with the meausurements to judge what was a real mean/std or not so I chose to capture as many as possible as opposed to using columns that contained "mean()" or "std()"<br/>
- Combined the training data sets using cbind() and test data sets using cbind()<br/>
- Combined the training and test data sets together using rbind()<br/>
- Transformed the numeric "Activity" variable into a factor with levels contained in the "activity_labels.txt" file <br/>
- Changed column names to make them more informative<br/>
- Used the dplyr package to create a df containing the avergae of the readings by Acitivity and SubjectID and exported that to a text file<br/>

Study design
==================================================================
#####This section is copied from the "README.txt" file<br/>
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.




#Variables

SubjectID<br/>
&nbsp;&nbsp;ID of the test subject.  Numeric.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;1...30
    
Activity<br/>
&nbsp;&nbsp;Type of Activity being performed.  Factor.<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;1 .WALKING<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;2 .WALKING_UPSTAIRS<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;3 .WALKING_DOWNSTAIRS<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;4 .SITTING<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;5 .STANDING<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;6 .LAYING<br/>
   
#####Measurement Variables - largely copied from "features_info.txt"
The measures below all correspond to the following descriptions:
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Each measurement is a mean or standard deviation of the reading scaled between -1 adn 1 and are coded as:

tBodyAcc-mean()-X<br/>
tBodyAcc-mean()-Y<br/>
tBodyAcc-mean()-Z<br/>
tGravityAcc-mean()-X<br/>
tGravityAcc-mean()-Y<br/>
tGravityAcc-mean()-Z<br/>
tBodyAccJerk-mean()-X<br/>
tBodyAccJerk-mean()-Y<br/>
tBodyAccJerk-mean()-Z<br/>
tBodyGyro-mean()-X<br/>
tBodyGyro-mean()-Y<br/>
tBodyGyro-mean()-Z<br/>
tBodyGyroJerk-mean()-X<br/>
tBodyGyroJerk-mean()-Y<br/>
tBodyGyroJerk-mean()-Z<br/>
tBodyAccMag-mean()<br/>
tGravityAccMag-mean()<br/>
tBodyAccJerkMag-mean()<br/>
tBodyGyroMag-mean()<br/>
tBodyGyroJerkMag-mean()<br/>
fBodyAcc-mean()-X<br/>
fBodyAcc-mean()-Y<br/>
fBodyAcc-mean()-Z<br/>
fBodyAcc-meanFreq()-X<br/>
fBodyAcc-meanFreq()-Y<br/>
fBodyAcc-meanFreq()-Z<br/>
fBodyAccJerk-mean()-X<br/>
fBodyAccJerk-mean()-Y<br/>
fBodyAccJerk-mean()-Z<br/>
fBodyAccJerk-meanFreq()-X<br/>
fBodyAccJerk-meanFreq()-Y<br/>
fBodyAccJerk-meanFreq()-Z<br/>
fBodyGyro-mean()-X<br/>
fBodyGyro-mean()-Y<br/>
fBodyGyro-mean()-Z<br/>
fBodyGyro-meanFreq()-X<br/>
fBodyGyro-meanFreq()-Y<br/>
fBodyGyro-meanFreq()-Z<br/>
fBodyAccMag-mean()<br/>
fBodyAccMag-meanFreq()<br/>
fBodyBodyAccJerkMag-mean()<br/>
fBodyBodyAccJerkMag-meanFreq()<br/>
fBodyBodyGyroMag-mean()<br/>
fBodyBodyGyroMag-meanFreq()<br/>
fBodyBodyGyroJerkMag-mean()<br/>
fBodyBodyGyroJerkMag-meanFreq()<br/>
angle(tBodyAccMean,gravity)<br/>
angle(tBodyAccJerkMean),gravityMean)<br/>
angle(tBodyGyroMean,gravityMean)<br/>
angle(tBodyGyroJerkMean,gravityMean)<br/>
angle(X,gravityMean)<br/>
angle(Y,gravityMean)<br/>
angle(Z,gravityMean)<br/>
tBodyAcc-std()-X<br/>
tBodyAcc-std()-Y<br/>
tBodyAcc-std()-Z<br/>
tGravityAcc-std()-X<br/>
tGravityAcc-std()-Y<br/>
tGravityAcc-std()-Z<br/>
tBodyAccJerk-std()-X<br/>
tBodyAccJerk-std()-Y<br/>
tBodyAccJerk-std()-Z<br/>
tBodyGyro-std()-X<br/>
tBodyGyro-std()-Y<br/>
tBodyGyro-std()-Z<br/>
tBodyGyroJerk-std()-X<br/>
tBodyGyroJerk-std()-Y<br/>
tBodyGyroJerk-std()-Z<br/>
tBodyAccMag-std()<br/>
tGravityAccMag-std()<br/>
tBodyAccJerkMag-std()<br/>
tBodyGyroMag-std()<br/>
tBodyGyroJerkMag-std()<br/>
fBodyAcc-std()-X<br/>
fBodyAcc-std()-Y<br/>
fBodyAcc-std()-Z<br/>
fBodyAccJerk-std()-X<br/>
fBodyAccJerk-std()-Y<br/>
fBodyAccJerk-std()-Z<br/>
fBodyGyro-std()-X<br/>
fBodyGyro-std()-Y<br/>
fBodyGyro-std()-Z<br/>
fBodyAccMag-std()<br/>
fBodyBodyAccJerkMag-std()<br/>
fBodyBodyGyroMag-std()<br/>
fBodyBodyGyroJerkMag-std()<br/>