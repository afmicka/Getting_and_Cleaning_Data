Code Book
====================

### tidy_data.txt created by run_analysis.R

The dataset in 'tidy_data.txt' file comes from the transformation of the data in the 'Human Activity Recognition Using Smartphones Dataset' that is built from the recordings of 30 subjects performing 6 different activities while carrying a waist-mounted smartphone with embedded inertial sensors. Raw data consist of 17 variables estimated for 33 different signals, resulting in 561-feature vector with time and frequency domain variables, along with activity label for each record and identifier of the subject who carried out the experiment. The dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. More information on this data can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The **tidy_data.txt** contains the average values of the measurements on the mean and standard deviation of each of the signals in the original dataset for a given subject and activity in both test and train sets that are merged into one dataset. All feature variables are normalized and bounded within [-1,1], thus have no units. The data transformation has been performed with **run_analysis.R** script described in README.md file. The dataset has 180 observations of the following 68 variables:

1. **subjectID** : .identifier of the subject who carried out the experiment
    - values of 1 : 30
2. **activity** : .activity label for each record
    - 1 - WALKING
    - 2 - WALKING_UPSTAIRS
    - 3 - WALKING_DOWNSTAIRS 
    - 4 - SITTING
    - 5 - STANDING
    - 6 - LAYING
3. **tBodyAcc-mean()-X** : .average value of mean time domain body acceleration along X-axis
4. **tBodyAcc-mean()-Y** : .average value of mean time domain body acceleration along Y-axis
5. **tBodyAcc-mean()-Z** : .average value of mean time domain body acceleration along Z-axis
6. **tGravityAcc-mean()-X** : .average value of mean time domain gravity acceleration along X-axis
7. **tGravityAcc-mean()-Y** : .average value of mean time domain gravity acceleration along Y-axis
8. **tGravityAcc-mean()-Z** : .average value of mean time domain gravity acceleration along Z-axis
9. **tBodyAccJerk-mean()-X** : .average value of mean time domain body acceleration Jerk signal along X-axis
10. **tBodyAccJerk-mean()-Y** : .average value of mean time domain body acceleration Jerk signal along Y-axis
11. **tBodyAccJerk-mean()-Z** : .average value of mean time domain body acceleration Jerk signal along Z-axis
12. **tBodyGyro-mean()-X** : .average value of mean time domain body angular velocity along X-axis
13. **tBodyGyro-mean()-Y** : .average value of mean time domain body angular velocity along Y-axis
14. **tBodyGyro-mean()-Z** : .average value of mean time domain body angular velocity along Z-axis
15. **tBodyGyroJerk-mean()-X** : .average value of mean time domain body angular velocity Jerk signal along X-axis
16. **tBodyGyroJerk-mean()-Y** : .average value of mean time domain body angular velocity Jerk signal along Y-axis
17. **tBodyGyroJerk-mean()-Z** : .average value of  meantime domain body angular velocity Jerk signal along Z-axis
18. **tBodyAccMag-mean()** : .average value of mean time domain body acceleration magnitude
19. **tGravityAccMag-mean()** : .average value of mean time domain gravity acceleration magnitude
20. **tBodyAccJerkMag-mean()** : .average value of mean time domain body acceleration Jerk signal magnitude
21. **tBodyGyroMag-mean()** : .average value of mean time domain body angular velocity magnitude
22. **tBodyGyroJerkMag-mean()** : .average value of mean time domain body angular velocity Jerk signal magnitude
23. **fBodyAcc-mean()-X** : .average value of mean frequency domain body acceleration along X-axis
24. **fBodyAcc-mean()-Y** : .average value of mean frequency domain body acceleration along Y-axis
25. **fBodyAcc-mean()-Z** : .average value of mean frequency domain body acceleration along Z-axis
26. **fBodyAccJerk-mean()-X** : .average value of mean frequency domain body acceleration Jerk signal along X-axis
27. **fBodyAccJerk-mean()-Y** : .average value of mean frequency domain body acceleration Jerk signal along Y-axis
28. **fBodyAccJerk-mean()-Z** : .average value of mean frequency domain body acceleration Jerk signal along Z-axis
29. **fBodyGyro-mean()-X** : .average value of mean frequency domain body angular velocity along X-axis
30. **fBodyGyro-mean()-Y** : .average value of mean frequency domain body angular velocity along Y-axis
31. **fBodyGyro-mean()-Z** : .average value of mean frequency domain body angular velocity along Z-axis
32. **fBodyAccMag-mean()** : .average value of mean frequency domain body acceleration magnitude
33. **fBodyBodyAccJerkMag-mean()** : .average value of mean frequency domain body acceleration Jerk signal magnitude
34. **fBodyBodyGyroMag-mean()** : .average value of mean frequency domain body angular velocity magnitude
35. **fBodyBodyGyroJerkMag-mean()** : .average value of mean frequency domain body angular velocity Jerk signal magnitude
36. **tBodyAcc-std()-X** : .average value of time domain body acceleration along X-axis standard deviation
37. **tBodyAcc-std()-Y** : .average value of time domain body acceleration along Y-axis standard deviation 
38. **tBodyAcc-std()-Z** : .average value of time domain body acceleration along Z-axis standard deviation
39. **tGravityAcc-std()-X** : .average value of time domain gravity acceleration along X-axis standard deviation
40. **tGravityAcc-std()-Y** : .average value of time domain gravity acceleration along Y-axis standard deviation
41. **tGravityAcc-std()-Z** : .average value of time domain gravity acceleration along Z-axis standard deviation
42. **tBodyAccJerk-std()-X** : .average value of time domain body acceleration Jerk signal along X-axis standard deviation
43. **tBodyAccJerk-std()-Y** : .average value of time domain body acceleration Jerk signal along Y-axis standard deviation
44. **tBodyAccJerk-std()-Z** : .average value of time domain body acceleration Jerk signal along Z-axis standard deviation
45. **tBodyGyro-std()-X** : .average value of time domain body angular velocity along X-axis standard deviation
46. **tBodyGyro-std()-Y** : .average value of time domain body angular velocity along Y-axis standard deviation
47. **tBodyGyro-std()-Z** : .average value of time domain body angular velocity along Z-axis standard deviation
48. **tBodyGyroJerk-std()-X** : .average value of time domain body angular velocity Jerk signal along X-axis standard deviation
49. **tBodyGyroJerk-std()-Y** : .average value of time domain body angular velocity Jerk signal along Y-axis standard deviation
50. **tBodyGyroJerk-std()-Z** : .average value of time domain body angular velocity Jerk signal along Z-axis standard deviation
51. **tBodyAccMag-std()** : .average value of time domain body acceleration magnitude standard deviation
52. **tGravityAccMag-std()** : .average value of time domain gravity acceleration magnitude standard deviation
53. **tBodyAccJerkMag-std()** : .average value of time domain body acceleration Jerk signal magnitude standard deviation
54. **tBodyGyroMag-std()** : .average value of time domain body angular velocity magnitude standard deviation
55. **tBodyGyroJerkMag-std()** : .average value of time domain body angular velocity Jerk signal magnitude standard deviation
56. **fBodyAcc-std()-X** : .average value of frequency domain body acceleration along X-axis standard deviation
57. **fBodyAcc-std()-Y** : .average value of frequency domain body acceleration along Y-axis standard deviation
58. **fBodyAcc-std()-Z** : .average value of frequency domain body acceleration along Z-axis standard deviation
59. **fBodyAccJerk-std()-X** : .average value of frequency domain body acceleration Jerk signal along X-axis standard deviation
60. **fBodyAccJerk-std()-Y** : .average value of frequency domain body acceleration Jerk signal along Y-axis standard deviation
61. **fBodyAccJerk-std()-Z** : .average value of frequency domain body acceleration Jerk signal along Z-axis standard deviation 
62. **fBodyGyro-std()-X** : .average value of frequency domain body angular velocity along X-axis standard deviation
63. **fBodyGyro-std()-Y** : .average value of frequency domain body angular velocity along Y-axis standard deviation
64. **fBodyGyro-std()-Z** : .average value of frequency domain body angular velocity along Z-axis standard deviation
65. **fBodyAccMag-std()** : .average value of frequency domain body acceleration magnitude standard deviation
66. **fBodyBodyAccJerkMag-std()** : .average value of frequency domain body acceleration Jerk signal magnitude standard deviation
67. **fBodyBodyGyroMag-std()** : .average value of frequency domain body angular velocity magnitude standard deviation
68. **fBodyBodyGyroJerkMag-std()** : .average value of frequency domain body angular velocity Jerk signal magnitude standard deviation
