
# Code
The script run_analysis.R performs this 5 steps, with two previous ones (0a, 0b) and one intermediate one (*):
0a. Open plyr package using library() function.
0b. Read downloaded files with the function read.table.
1. Merge the training and the test sets to create one data set using the funtion rbind().
2. Extracts only the measurements on the mean and standard deviation for each measurement, using the function grep(), doing after a subsetting and a change in column names.
3. Uses descriptive activity names to name the activities in the data set, by updating values with correct activity names.
4. Appropriately labels the data set with descriptive variable names, by using the function names(). 
*. Merge the training and the test sets to create one data set using the funtion cbind().
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject, by using ddply() function, and the write.table to create a txt file.

# Variables description
xtrain, ytrain, xtest, ytest, subjecttrain and subjecttest are the data obtained from the downloaded files.
xdata, ydata and subjectdata merge the previous datasets .
features contains the correct names for the xdata dataset, applied to the column names included in mean_std, a numeric vector used to extract these data.
activity contains the correct names for ydata dataset, through the activitylabels variable.
totaldata merges xdata, ydata and subjectdata.
tidydata contains the average of each variable for each activity and each subject obtained from the previous dataset.
