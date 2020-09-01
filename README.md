# Run_Analysis_Project2 - Code Book

## Data Description

The purpose of this project is to get and clean experimental data uploaded on the website below. The data is from measueremnts collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The link to the specific data used for the project is:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code provided performs the following:
### 1. Merges the training and the test sets to create one data set.
After the appropriate file sets are downloaded, he Activity ID with its respective dataset is combined first using the cbind function first. These results in 2 data sets each containing 561 variables. These final result are joined into one data set consisting of 10299 observations of 562 variables  

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Labels for each column provided from the features.txt file was assigned to each column. Make.names function was used to create unique header names(unrecognized special characters in these names were replaced by "."
The select function was then used to select those names that had mean or std in the string

### 3. Uses descriptive activity names to name the activities in the data set
recode function was used to create another column with descriptive names for each activity

### 4. Appropriately labels the data set with descriptive variable names.
gsub function was used to create appropriate labels(text without special characters or spaces)

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Subject data for both the test and train data was downloaded,then combined to create one data set with all the IDs corresponding to each of the 10299 observations. This result was then added to the final data set obtained in question 4. The average of all variables was then found using the group_by function to group data by required variables, and then determine the mean of each variable.




