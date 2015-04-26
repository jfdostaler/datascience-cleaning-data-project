#Code Book
##Attribution
This is adapted from the code book for the original data that this assignment is based on. The data set can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the original code book is found in the features_info.txt file provided with the data set. Further information is in README.txt.

The code book has been modified to reflect changes to the data in the tidying process, and has been reformatted in MarkDown.

## Data Sets
1. Tidy data *(output from Step 4 of the assignment)*
	- [Link](https://github.com/jfdostaler/datascience-cleaning-data-project/blob/master/full_data.txt)
	- Features are fully described in the **Feature Description** section below.
2. Summarized data *(output from Step 5 of the assignment)*
	- [Link](https://github.com/jfdostaler/datascience-cleaning-data-project/blob/master/summarized_data.txt)
	- Variables have been grouped by Subject and Activity. As such, there is only one row per Subject/Activity combination.
	- The value of each feature corresponds to the mean of that value for the corresponding group.
	- Feature names are identical between the data sets.
		- (Because of the complex nature of the data set, identifying the aggregate data as a Mean in the variable name was likely to cause confusion rather than add clarity.)

## Grouping Description
There are two factors by which the data is grouped.

- **Subject** is a numeric value corresponding to a subject whose movements were recorded during the original experiment. There were a total of 30 volunteers in the experiment, randomly split into a test group and a training group. Those two data sets have been merged into one, so the value of Subject ranges from *1* to *30*.

- **Activity** is a descriptive name for the activity being measured in the experiment. The possible values are:
	- WALKING
	- WALKING_UPSTAIRS
	- WALKING_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING

## Feature Description
*Note*: All features are normalized and bounded within [-1,1].

The features selected for this database come from the *accelerometer* and *gyroscope* 3-axial raw signals *tAcc-XYZ* and *tGyro-XYZ*. These time domain signals (prefix '*t*' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (*tBodyAcc-XYZ* and *tGravityAcc-XYZ*) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (*tBodyAccJerk-XYZ* and *tBodyGyroJerk-XYZ* ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (*tBodyAccMag*, *tGravityAccMag*, *tBodyAccJerkMag*, *tBodyGyroMag*, *tBodyGyroJerkMag*). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing *fBodyAcc-XYZ*, *fBodyAccJerk-XYZ*, *fBodyGyro-XYZ*, *fBodyAccJerkMag*, *fBodyGyroMag*, *fBodyGyroJerkMag*. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'*-XYZ*' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

**mean()**: Mean value
**std()**: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

