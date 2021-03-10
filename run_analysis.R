#Script Name: run_analysis.R
#Purpose: Script designed to ingest and analyze data from wearable device sensors
#for the purpose of passing the "Getting and Cleaning Data" course from JHU as part
#of the Data Science Specialization
#Author: Sean M. Spencer
#Date Created: 8 March 2021
#Contact Info: seanspencer95@gmail.com


library(dplyr)

#read in the data to dataframes

features <- read.table("Data/features.txt", col.names = c("n", "functions"))
activities <- read.table("Data/activity_labels.txt", col.names = c("code", "activity_labels"))
subject_test <- read.table("Data/test/subject_test.txt", col.names = c("subject"))
subject_train <- read.table("Data/train/subject_train.txt", col.names = c("subject"))

x_test <- read.table("Data/test/X_test.txt", col.names = features$functions)
y_test <- read.table("Data/test/y_test.txt", col.names = c("code"))

x_train <- read.table("Data/train/X_train.txt", col.names = features$functions)
y_train <- read.table("Data/train/y_train.txt", col.names = c("code"))

#do some quick data checking before heading into joins
if (ncol(x_test) == ncol(x_train)) {
  print("Everything matches, good to go!")
} else {
  print("These data sets don't line up, cannot proceed to joins")
  stop()
}

#create a unified data set via the following joins:
#subject_train:subject_test
#x_train:x_test
#y_train:y_test

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged <- cbind(subject, x, y)

clean <- merged %>% select(subject, code, contains("mean"), contains("std"))

clean$code <- activities[clean$code, 2]

#tidy the column names using gsub
colnames(clean) <- gsub("Acc", "Acceleration", colnames(clean))
colnames(clean) <- gsub("^t", "Time", colnames(clean))
colnames(clean) <- gsub("^f", "Frequency", colnames(clean))
colnames(clean) <- gsub("BodyBody", "Body", colnames(clean))
colnames(clean) <- gsub("Mag", "Magnitude", colnames(clean))
colnames(clean) <- gsub("-freq()", "Frequency", colnames(clean), ignore.case = TRUE)
colnames(clean) <- gsub("-mean()", "Mean", colnames(clean), ignore.case = TRUE)
colnames(clean) <- gsub("-std()", "STD", colnames(clean), ignore.case = TRUE)


#step 5 create a second tidy set with average of each activity for each subject
clean_new <- clean %>%
  group_by(subject, code) %>%
  summarise_all(mean)

write.table(clean_new, "clean_new.txt", row.name = FALSE)

