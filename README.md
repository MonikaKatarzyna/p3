# p3

There is just one run_analysis.R code that does all that is needed to prepare the tidy data set for this project.

This repo explains how the script works.

There is just one run_analysis.R code that does all that is needed to prepare the tidy data set for this project.

Here are the steps of the analysis:

1.	Read the test and training data from files: x_train.txt, y_train.txt, x_test.txt, y_test.txt, subject_train.txt, subject_test.txt to tables: trainX, trainY, testX, testY, trainSubj, testSubj
2.	Merge training and test data with rbind. Initially the X, Y and Subject data is kept separately at tables X, Y and S.
3.	Read features' names from features.txt to fnames table. Only the second column of the fnames table is kept (this is where the features names are).
4.	We built a boolean vectors meanCols and stdCols, that contain TRUE for columns that correspond to feature names having "mean" and "std" in their names.
5.	We use these Boolean vectors to create an array containing feature names that have "mean" or "std". The result is kept in meanStdNames.
6.	With meanX we select columns of X that correspond to features that have "mean" in their name and we do the same for stdX (we'll have there columns of X that correspond to features that have "std" in their names).
7.	We combine meanX and stdX with cbind into one table, meanStdX that will have columns of X that have "mean" or "std" in their names.
8.	We read activity labels file "activity_labels.txt" into acNames, keeping only second column which contains actual activity names. Then we replace numerical activity codes in Y with their corresponding descriptive activity names. The result is kept in YNames.
9.	We merge YNames, S, and meanStdX into one table ASX.
10.	We label columns of ASX: first is "Activity", second is "Subject" and the remaining names are taken from meanStdNames. The lables are kept in allColNames. We assign allColNames to names of ASX.
11.	We save ASX into "all.csv".
12.	We calculated mean of all variables grouped by Activity and Subject using aggregate function and save the result to "summary.csv".

