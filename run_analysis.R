#Unzipping and downloading required data to be merged
install.packages("dplyr")
library(dplyr)


url1<-
  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <-tempfile()
download.file(url1,temp, mode="w")
test<-read.table(unzip(temp, "UCI HAR Dataset/test/X_test.txt"), sep="")
test_y<-read.table(unzip(temp, "UCI HAR Dataset/test/y_test.txt"), sep="")
test_final<-cbind(test_y, test)
train<-read.table(unzip(temp, "UCI HAR Dataset/train/X_train.txt"), sep="")
train_y<-read.table(unzip(temp, "UCI HAR Dataset/train/y_train.txt"), sep="")
train_final<-cbind(train_y, train)

#Merging the test and train data frames
result<-rbind(test_final, train_final)

#Reordering data set by activity
labels<-read.table(unzip(temp, "UCI HAR Dataset/features.txt"), sep="")
labels_names<-t(labels[,2])
row_1<-data.frame("ActivityId")
labels_f<-cbind(row_1, labels_names)
colnames(result)<-make.names(labels_f, unique=TRUE)


#Extracting the mean and standard deviation from each measurement
#Need to convert character strings to vector strings and use the select function to
#select those columns whose names have "std" or "mean"
v_string<-c("mean", "std")
matchE<- paste(v_string, collapse = "|") #selecting a vector of strings
mean_std<-select(result, matches(matchE))


#Using descriptive activity names to name the activities in the data set
result$Activities<-recode(result$ActivityId, `1`= "WALKING",`2`= "WALKING_UPSTAIRS",
                            `3`="WALKING_DOWNSTAIRS", `4`= "SITTING", `5`="STANDING",
                            `6`="LAYING")

#Appropriately labels the data set with descriptive variable names
#Based on discussion forum, this means removing the "." in the column names
result_c<-gsub("\\.","", colnames(result))                                      
colnames(result) <-result_c                                                         
length(unique(names(result))) #confirming that all header names are unique

#Creating data set with average by Activity and Subject ID

subject_test<-read.table(unzip(temp, "UCI HAR Dataset/test/subject_test.txt"), sep="")
subject_train<-read.table(unzip(temp, "UCI HAR Dataset/train/subject_train.txt"), sep="")
subjectid<-rbind(subject_test,subject_train)
colnames(subjectid)<-c("SubjectId")
final<-cbind(subjectid,result)
final_tidy<-final %>% group_by(Activities,SubjectId) %>%
  summarise_all(mean, na.rm = TRUE)
write.table(final_tidy, file="./Week 1/final_tidy.txt", row.names = FALSE)
write.csv(final_tidy, file="./Week 1/final_tidy.csv", row.names = FALSE)


