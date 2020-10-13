# Code Book 
This feature description draws heavily upon the description provided in "HCI HAR Dataset/feature_info.text". Further information on
the raw dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The features selected for the UCI HAR Dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Of this data, only the mean and standard deviation values are retained.

| Variable Name | Variable Label | Type |
|---------------|----------------|------|
| subjectid | Subject Identifier | integer |
| activity | One of six activities: STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS | character |
| tbodyaccmeanx | Time domain body acceleration mean x | numeric |  
| tbodyaccmeany | Time domain body acceleration mean y | numeric | 
| tbodyaccmeanz | Time domain body acceleration mean z | numeric |  
| tbodyaccstdx  | Time domain body acceleration standard deviation x | numeric | 
| tbodyaccstdy  | Time domain body acceleration standard deviation y | numeric | 
| tbodyaccstdz  | Time domain body acceleration standard deviation z | numeric | 
| tgravityaccmeanx | Time domain gravity acceleration mean x | numeric | 
| tgravityaccmeany | Time domain gravity acceleration mean y | numeric |
| tgravityaccmeanz | Time domain gravity acceleration mean z | numeric | 
| tgravityaccstdx | Time domain gravity acceleration standard deviation x | numeric | 
| tgravityaccstdy | Time domain gravity acceleration standard deviation y | numeric | 
| tgravityaccstdz | Time domain gravity acceleration standard deviation z | numeric | 
| tbodyaccjerkmeanx | Time domain body acceleration mean x | numeric | 
| tbodyaccjerkmeany | Time domain body acceleration mean y | numeric | 
| tbodyaccjerkmeanz | Time domain body acceleration mean z | numeric | 
| tbodyaccjerkstdx | Time domain body acceleration std x | numeric | 
| tbodyaccjerkstdy | Time domain body acceleration std y | numeric | 
| tbodyaccjerkstdz | Time domain body acceleration std z | numeric | 
| tbodygyrojerkmeanx | Time domain body gyro mean x | numeric | 
| tbodygyrojerkmeany | Time domain body gyro mean y | numeric | 
| tbodygyrojerkmeanz | Time domain body gyro mean z | numeric | 
| tbodygyrojerkstdx | Time domain body gyro std x | numeric | 
| tbodygyrojerkstdy | Time domain body gyro std y | numeric | 
| tbodygyrojerkstdz | Time domain body gyro std z | numeric | 
| tbodygyrojerkmeanx | Time domain body gyro jerk mean x | numeric | 
| tbodygyrojerkmeany | Time domain body gyro jerk mean y | numeric | 
| tbodygyrojerkmeanz | Time domain body gyro jerk mean z | numeric | 
| tbodygyrojerkstdx | Time domain body gyro jerk std x | numeric | 
| tbodygyrojerkstdy | Time domain body gyro jerk std y | numeric | 
| tbodygyrojerkstdz | Time domain body gyro jerk std z | numeric | 
| tbodyaccmagmean | Time domain body acceleration magnitude mean | numeric | 
| tbodyaccmagstd | Time domain body acceleration magnitude standard deviation | numeric | 
| tgravityaccmagmean | Time domain gravity acceleration magnitude mean | numeric | 
| tgravityaccmagstd | Time domain gravity acceleration magnitude standard deviation | numeric | 
| tbodyaccjerkmagmean | Time domain body acceleration jerk magnitude mean | numeric | 
| tbodyaccjerkmagstd | Time domain body acceleration jerk magnitude standard deviation | numeric | 
| tbodygyromagmean | Time domain body gyro magnitude mean | numeric | 
| tbodygyromagstd | Time domain body gyro magnitude standard deviation | numeric | 
| tbodygyrojerkmagmean | Time domain body gyro jerk magnitude mean | numeric | 
| tbodygyrojerkmagstd | Time domain body gyro jerk magnitude standard deviation | numeric | 
| fbodyaccmeanx | Frequency domain body acceleration mean x | numeric | 
| fbodyaccmeany | Frequency domain body acceleration mean y | numeric | 
| fbodyaccmeanz | Frequency domain body acceleration mean z | numeric | 
| fbodyaccstdx | Frequency domain body acceleration std x | numeric | 
| fbodyaccstdy | Frequency domain body acceleration std y | numeric | 
| fbodyaccstdz | Frequency domain body acceleration std z | numeric | 
| fbodyaccmeanfreqx | Frequency domain body acceleration mean frequency x | numeric | 
| fbodyaccmeanfreqy | Frequency domain body acceleration mean frequency y | numeric | 
| fbodyaccmeanfreqz | Frequency domain body acceleration mean frequency y | numeric | 
| fbodyaccjerkmeanx | Frequency domain body acceleration jerk mean x | numeric | 
| fbodyaccjerkmeany | Frequency domain body acceleration jerk mean y | numeric | 
| fbodyaccjerkmeanz | Frequency domain body acceleration jerk mean z | numeric | 
| fbodyaccjerkstdx | Frequency domain body acceleration jerk std x | numeric | 
| fbodyaccjerkstdy | Frequency domain body acceleration jerk std y | numeric | 
| fbodyaccjerkstdz | Frequency domain body acceleration jerk std z | numeric | 
| fbodyaccjerkmeanfreqx | Frequency domain body acceleration jerk mean frequency x | numeric |  
| fbodyaccjerkmeanfreqy | Frequency domain body acceleration jerk mean frequency y | numeric | 
| fbodyaccjerkmeanfreqz | Frequency domain body acceleration jerk mean frequency z | numeric | 
| fbodygyromeanx | Frequency domain body gyro  mean x | numeric | 
| fbodygyromeany | Frequency domain body gyro  mean y | numeric | 
| fbodygyromeanz | Frequency domain body gyro  mean z | numeric | 
| fbodygyrostdx | Frequency domain body gyro  std x | numeric | 
| fbodygyrostdy | Frequency domain body gyro  std y | numeric | 
| fbodygyrostdz | Frequency domain body gyro  std z | numeric | 
| fbodygyromeanfreqx | Frequency domain body gyro jerk mean frequency x | numeric | 
| fbodygyromeanfreqy | Frequency domain body gyro jerk mean frequency y | numeric | 
| fbodygyromeanfreqz | Frequency domain body gyro jerk mean frequency z | numeric | 
| fbodyaccmagmean | Frequency domain body acceleration magnitude mean | numeric | 
| fbodyaccmagstd | Frequency domain body acceleration magnitude standard deviation | numeric |  
| fbodyaccmagmeanfreq | Frequency domain body acceleration magnitude mean frequency | numeric | 
| fbodybodyaccjerkmagmean | Frequency domain body acceleration jerk magnitude mean | numeric |  
| fbodybodyaccjerkmagstd | Frequency domain body acceleration jerk magnitude standard deviation | numeric | 
| fbodybodyaccjerkmagmeanfreq | Frequency domain body acceleration jerk magnitude mean frequency | numeric | 
| fbodybodygyromagmean | Frequency domain body body gyro magnitude mean | numeric | 
| fbodybodygyromagstd | Frequency domain body body gyro magnitude standard deviation | numeric | 
| fbodybodygyromagmeanfreq | Frequency domain body body gyro magnitude mean frequency | numeric |  
| fbodybodygyrojerkmagmean | Frequency domain body body gyro jerk magnitude mean | numeric |  
| fbodybodygyrojerkmagstd | Frequency domain body body gyro jerk magnitude standard deviation | numeric | 
| fbodybodygyrojerkmagmeanfreq | Frequency domain body body gyro jerk magnitude mean frequency | numeric | 
| angletbodyaccmeangravity | Angle time domain body acceleration mean gravity | numeric | 
| angletbodyaccjerkmeangravitymean | Angle time domain body acceleration jerk mean gravity mean | numeric | 
| angletbodygyromeangravitymean | Angle time domain body gyro mean gravity mean | numeric | 
| angletbodygyrojerkmeangravitymean | Angle time domain body gyro jerk mean gravity mean | numeric |  
| anglexgravitymean | Angle x gravity mean | numeric | 
| angleygravitymean | Angle y gravity mean | numeric |  
| anglezgravitymean | Angle z gravity mean | numeric |  
