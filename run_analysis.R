# 1. Merges the training and the test sets to create one data set ---------
dataSetX <- read.table('UCI HAR Dataset/test/X_test.txt',header = FALSE);
dataSetX <- rbind(dataSetX, 
                  read.table('UCI HAR Dataset/train/X_train.txt',header = FALSE));


# 2. Extracts only the measurements on the mean and standard deviatio -----
names <- read.table('UCI HAR Dataset/features.txt',header = FALSE);
names <- names$V2;
names(dataSetX) <- names;

collumns_needed <- grep("(.std\\(\\).|.mean\\(\\).)",names);
dataSetX <- dataSetX[,collumns_needed];

# 3. Uses descriptive activity names to name the activities in the da -----
dataSetY <- read.table('UCI HAR Dataset/train/y_train.txt',header = FALSE);
dataSetY <- rbind(dataSetY,
                  read.table('UCI HAR Dataset/test/y_test.txt',header = FALSE));

activityLabels <- read.table('UCI HAR Dataset/activity_labels.txt',header = FALSE);
dataSetY$V1 <- factor(x = dataSetY$V1, levels = activityLabels$V1,
                         labels = activityLabels$V2);

# 4. Appropriately labels the data set with descriptive variable names ----
names(dataSetX) <- gsub("(^t)","time",names(dataSetX));
names(dataSetX) <- gsub("(^f)","frequency",names(dataSetX));
names(dataSetX) <- gsub("(.Jerk.)","FastFourierTransform",names(dataSetX));
names(dataSetX) <- gsub("(mean\\(\\))","Mean",names(dataSetX));
names(dataSetX) <- gsub("(std\\(\\))","StandardDeviation",names(dataSetX));
names(dataSetX) <- gsub("-","",names(dataSetX));

# 5. Creates a second, independent tidy data set with the average of  -----
library(reshape2);

subject <- read.table('UCI HAR Dataset/train/subject_train.txt',header = FALSE);
subject <- rbind(subject,
                  read.table('UCI HAR Dataset/test/subject_test.txt',header = FALSE));
names(dataSetY) <- c("activity");
names(subject) <- c("subject");
secondDataSet <- cbind(dataSetY,subject);
secondDataSet <- cbind(secondDataSet,dataSetX);

DataSetMelt <- melt(secondDataSet, id = c("subject", "activity"), measure.vars = names(dataSetX));

secondDataSet <- dcast(DataSetMelt, subject + activity ~ variable, mean);

# # Name the set
# names <- read.table('UCI HAR Dataset/features.txt',header = FALSE);
# names <- names$V2;
# names <- tolower(names);
# #names <- gsub("()","",names);
# names(x_test) <- names;
# names(x_train) <- names;
# 
# #Extract only means and stds
# names_n <- grep("(.std\\(\\).|.mean\\(\\).)",names);
# x_test <- x_test[,names_n];
# x_train <- x_train[,names_n];
# 
# # Merge xy
# # train <- cbind(x_train,y_train);
# # test <- cbind(x_test,y_test);
# 
# # Merge train and test sets
# 
# 
# #Make variables human readable


