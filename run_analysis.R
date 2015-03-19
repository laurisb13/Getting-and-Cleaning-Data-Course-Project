#run_analysis.R

#########################

#Preparatory steps: read data

#Open library
library(plyr)

#Read general data
setwd("C:/Laura/Cursos/Getting and cleaning data/Week 3/UCI HAR Dataset")
features <- read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")

#Read test data
setwd("C:/Laura/Cursos/Getting and cleaning data/Week 3/UCI HAR Dataset/test")
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
subjecttest <- read.table("subject_test.txt")

#Read train data
setwd("C:/Laura/Cursos/Getting and cleaning data/Week 3/UCI HAR Dataset/train")
xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
subjecttrain <- read.table("subject_train.txt")

#########################

#1. Merge the training and the test sets to create one data set

#Merge training and test sets by x, y or subject data
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
subjectdata <- rbind(subjecttrain, subjecttest)

#Final merging of all data sets will be carried out in point 4

#########################

#2. Extracts only the measurements on the mean and standard deviation for each measurement

#Extract only columns with mean or std in their names
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset that columns in x data set
xdata <- xdata[, mean_std]

# Change column names in x data set
names(xdata) <- features[mean_std, 2]

#######################
# 3. Uses descriptive activity names to name the activities in the data set

ydata[, 1] <- activitylabels[ydata[, 1], 2]

######################

# 4. Appropriately labels the data set with descriptive variable names

# Change activity column name in y data set
names(ydata) <- "activity"

# Change subject column name in subject data set
names(subjectdata) <- "subject"

######################

# Final merging of all data sets of point 1
totaldata <- cbind(xdata, ydata, subjectdata)

#####################

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

tidydata <- ddply(totaldata, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(tidydata, "tidydata.txt", row.names=FALSE)
