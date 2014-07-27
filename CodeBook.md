Introduction
The raw data represent data collected from the accelerometers from the Samsung Galaxy S smartphone, which was already preprocessed. Prepocessing steps are described in file UCI HAR Dataset/features_info.txt which you can find in this directory. The raw data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Transformation
The raw data was split into test and train data set. First transformation is to put the two data sets together. In the second step, read the column names from file "features.txt" and find out columns which represent mean or standard deviation values. Then extract meand and std columns from raw data into a new variable. 
Thend read the "Y" data sets, which represent the activities, represent them as factors and name them accroding to "activity_labels.txt"
For better understanding, the columns are renamed as follows. All "t"s at begining of collumn name are replaced by "time". All "f"s are replaced by "frequency". The word "mean" is replaced by "Mean" and "std" is replaced by "StandardDeviation". At the end all minuses "-" are removed.
At the end the "X" and "Y" data sets are merged together and the means are calculated by subject (Person) and activity type by using "melt" and "dcast" functions of package "reshape2". The data is then saved into file tidyDataSet.txt in the same directory as run_analysis.R script.

Variables
1  subject - ID of person which was expected during tests. Integer. Discret values from 1 to 30.
2  activity - Activity type the person was doing. Factor with 6 levels.
  1  WALKING
  2	WALKING_UPSTAIRS
  3	WALKING_DOWNSTAIRS
  4	SITTING
  5	STANDING
  6	LAYING
  
All other variables are integers from -1 to 1 representing mean values by subject and acitivty:
3  timeBodyAccMeanX
4	timeBodyAccMeanY
5	timeBodyAccMeanZ
6	timeBodyAccStandardDeviationX
7	timeBodyAccStandardDeviationY
8	timeBodyAccStandardDeviationZ
9	timeGravityAccMeanX
10	timeGravityAccMeanY
11	timeGravityAccMeanZ
12	timeGravityAccStandardDeviationX
13	timeGravityAccStandardDeviationY
14	timeGravityAccStandardDeviationZ
15	timeBodyAccJerkMeanX
16	timeBodyAccJerkMeanY
17	timeBodyAccJerkMeanZ
18	timeBodyAccJerkStandardDeviationX
19	timeBodyAccJerkStandardDeviationY
20	timeBodyAccJerkStandardDeviationZ
21	timeBodyGyroMeanX
22	timeBodyGyroMeanY
23	timeBodyGyroMeanZ
24	timeBodyGyroStandardDeviationX
25	timeBodyGyroStandardDeviationY
26	timeBodyGyroStandardDeviationZ
27	timeBodyGyroJerkMeanX
28	timeBodyGyroJerkMeanY
29	timeBodyGyroJerkMeanZ
30	timeBodyGyroJerkStandardDeviationX
31	timeBodyGyroJerkStandardDeviationY
32	timeBodyGyroJerkStandardDeviationZ
33	frequencyBodyAccMeanX
34	frequencyBodyAccMeanY
35	frequencyBodyAccMeanZ
36	frequencyBodyAccStandardDeviationX
37	frequencyBodyAccStandardDeviationY
38	frequencyBodyAccStandardDeviationZ
39	frequencyBodyAccJerkMeanX
40	frequencyBodyAccJerkMeanY
41	frequencyBodyAccJerkMeanZ
42	frequencyBodyAccJerkStandardDeviationX
43	frequencyBodyAccJerkStandardDeviationY
44	frequencyBodyAccJerkStandardDeviationZ
45	frequencyBodyGyroMeanX
46	frequencyBodyGyroMeanY
47	frequencyBodyGyroMeanZ
48	frequencyBodyGyroStandardDeviationX
49	frequencyBodyGyroStandardDeviationY
50	frequencyBodyGyroStandardDeviationZ