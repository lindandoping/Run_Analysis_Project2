# Run_Analysis_Project2 - Code Book

## Data Description

The purpose of this project is to get and clean experimental data uploaded on the website below. The data is from measueremnts collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The link to the specific data used for the project is:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code provided performs the following:
### 1. Merges the training and the test sets to create one data set.
After the appropriate file sets are downloaded, the Activity ID with its respective dataset is combined first using the cbind function. These results in 2 data sets each containing 561 variables. The final test and training datasets are then joined into one data set consisting of 10299 observations  

### 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Labels for each column provided from the features.txt file was assigned to each column. Make.names function was used to create unique header names(unrecognized special characters such as "()" and "-" in these names were replaced by a period "."
The select function was then used to select those header names that had mean or std in the string

### 3. Uses descriptive activity names to name the activities in the data set
The recode function was used to create another column with descriptive names for each activity

### 4. Appropriately labels the data set with descriptive variable names.
The make.name function used earlier and gsub function was used to further simplify the character strings and create appropriate labels
Appropriate variable names should not have special characters.

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Subject data for both the test and train data was downloaded,then combined to create one data set with all the IDs corresponding to each of the 10299 observations. This result was then added to the final data set obtained in question 4. The average of all variables was then found using the group_by function to group the data by the subject ID and Activities, and then the mean was determined for each variable.

### Codebook
Used the codebook function and template provided in the reference manual to create a codebook
Also included R chunk codes in codebook template to output data for the relevant initial dataset provided- README.txt, Features.txt & Activity Labels.txt files



