Getting and Cleaning Data Course Project
========================================

The goal of this project is to process data from the 'Human Activity Recognition Using Smartphones Dataset' and prepare tidy dataset that can be used for later analysis, containing the average values of the measurements on the mean and standard deviation of each variable for a given subject and activity. 

The script **run_analysis.R** described below performs this cleaning process.

## Raw data

The provided dataset represent data collected from the accelerometers from the Samsung Galaxy S smartphone that a group of 30 volunteers within an age bracket of 19-48 years was wearing on the waist while performing six activities - walking, walking upstairs, walking downstairs, sitting, standing, and laying. For each record it provides 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The acceleration signal has been separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). The body linear acceleration and angular velocity (tBodyGyro-XYZ) were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). The magnitude of these three-dimensional signals were also calculated (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). To some of these signals a Fast Fourier Transformation (FFT) was applied producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag, where 'f' indicates frequency domain signals. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

These 33 signals were used to estimate variables of the feature vector for each pattern. For each of these signals the set of 17 variables was estimated, including mean values ('mean()'), standard deviation ('std()'), min() and max() values, average frequency component with largest magnitude (‘meanFreq()’), angle between vectors (‘angle()’), etc., resulting in dataset with a 561-feature vector with time and frequency domain variables. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

All the necessary information is stored in following files:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training activity labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test activity labels.
- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

**Note**: There are other files and folders in the provided dataset, but they are not used for this project.

More information about this dataset is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for this project can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Script run_analysis.R

The script can be run as long as the Samsung data is in your working directory in its original form. The code looks for the necessary data in the directory './UCI HAR Dataset/' structured as in the linked archive. If this folder is not in your working directory, the script will download the data from the link provided above and unzip it to your working directory.

The script also requires that the `dplyr` package is available. If it isn't installed, install this package with `install.packages()` before running the script. 

To run the script, type the following:
```r
source("run_analysis.R")
run_analysis()
```

While running, **run_analysis.R** performs the following actions:

- Reads in all of the files described above. Each of the files is read in with descriptive variable names. Data retrieved from 'subject_test.txt' and 'subject_train.txt' files is labeled as 'subjectID', data retrieved from 'y_test.txt' and 'y_train.txt' files is labeled as 'activity', while variables in data obtained from 'X_test.txt' and 'X_train.txt' files are named with their names given in 'feature.txt' file. Note that the dataset has **duplicated column names**. In order to ensure their distinction, but also keep the original form of their names, function `make.unique()` is passed to `col.names` argument in `read.table()` to append sequence numbers to duplicates and argument `check.names=FALSE` is set to prevent transforming special signs ('()', '-', etc.) to dots. 
- For each of the two sets (test and training) creates a data frame by merging all of the corresponding information together (subject ID, activity and feature measurements), and then merges both sets into one data frame with `rbind()`. The resulting data frame has 10299 observations of 563 variables (subjectID, activity and 561 features variables).
- Transforms `activity` variable as factor and replaces numeric values with the corresponding activity names given in 'activity_labels.txt file. 
- Uses `dplyr` package to select only variables with mean and standard deviation values (variables that contain “mean()” or “std()” in their names) for a given subject and performed activity, group the resulting dataset by ’subjectID’ and ‘activity’ and for each group calculate the average value for every feature variable in the selected dataset. The resulting data frame has 180 observations (30 subjects * 6 activities) with 68 variables (subjectID, activity and 66 features).
- Writes the resulting tidy dataset to a file called **tidy_data.txt** and stores it in the working directory. 


## Tidy dataset

The **tidy_data.txt** dataset contains average values of the measurements on the mean and standard deviation of each variable in the original dataset for a given subject and activity. It has 180 observations (30 subjects * 6 activities) with 68 variables (subjectID, activity and 66 features).

To read and preview the data, type:
```r
data <- read.table("tidy_data.txt", header = TRUE, check.names=FALSE)
head(data, n = 10)
```
```
##    subjectID           activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tGravityAcc-mean()-X tGravityAcc-mean()-Y
## 1          1            WALKING         0.2773308      -0.017383819        -0.1111481            0.9352232           -0.2821650
## 2          1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020            0.8933511           -0.3621534
## 3          1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662            0.9318744           -0.2666103
## 4          1            SITTING         0.2612376      -0.001308288        -0.1045442            0.8315099            0.2044116
## 5          1           STANDING         0.2789176      -0.016137590        -0.1106018            0.9429520           -0.2729838
## 6          1             LAYING         0.2215982      -0.040513953        -0.1132036           -0.2488818            0.7055498
## 7          2            WALKING         0.2764266      -0.018594920        -0.1055004            0.9130173           -0.3466071
## 8          2   WALKING_UPSTAIRS         0.2471648      -0.021412113        -0.1525139            0.7907174           -0.4162149
## 9          2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416        -0.1168129            0.8618313           -0.3257801
## 10         2            SITTING         0.2770874      -0.015687994        -0.1092183            0.9404773           -0.1056300
```

## Code Book

Refer to **CodeBook.md** for detailed description of the variables in the **tidy_data.txt**.

