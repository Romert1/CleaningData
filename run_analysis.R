# CleaningData

#  For the test you can run this command : 
# source(file="your_file_location/run_analysis.R", echo=TRUE) 
#  Or doing the following step by step for the test and train data:
# 1.  Loading mean and standard deviations columns
# 2.  Adding subject numbers
# 3.  Adding activity labels
# 4.  Summarize the data set, calculating means for all features per subject/activity.
# 5.  Write the summarized data to a file
# This script contains 3 functions to accomplish the above tasks (see below).
# The resulting data.frame is called "summary_of_the_data".  The resulting file  is save in  "summary_of_the_data.txt".

##########  0 - Add library  and initialized the number of row ########################

 install.packages("dplyr")
 
 library(dplyr)

lenght_of_rows <<-10299

############# 1-Loading mean and standard deviations columns ######################
#
# This firs part consist to read data :  X_test.txt  or X_train.txt  
# To make it possible well proceed like this:
# 1.  Read the file features.txt.
# 2. Choose  only the column names with  "mean" and "std"
# 3. Build the vector that we will use  on the files  X_test or X_train.txt  to get the 
# 4. only the appropriated columns with  "mean" and "std"
  

read_data <- function(data_test_train, lenght_of_rows = 10299)
{

   # Read the features and assing the column names to use it after 
   features <- read.table(file = "features.txt", as.is = TRUE, col.names = c("column_number","feature_name"))

   column_numbers <- features$column_number
   column_names <- features$feature_name


   # Construct a vector that we will use to have the subset 
   # Note that all the columns others to mean or std set  are set to null .
   
   mean_and_std_col_names <- features[grep("mean|std", features$feature_name), ]

   column_names_T_mean_and_std_or_F <- features$feature_name %in% mean_and_std_col_names$feature_name

   mean_and_std_col_NULL_NA <- replace(column_names_T_mean_and_std_or_F, column_names_T_mean_and_std_or_F == FALSE, "NULL")
   
   mean_and_std_col_NULL_NA <- replace(mean_and_std_col_NULL_NA, mean_and_std_col_NULL_NA == TRUE, NA)

 
   # col.names and colClasses must be the same length as the number of columns in the data file.
   # colClasses has NA for columns to load and the string "NULL" for columns to NOT load.
   the_data <- read.table(file = paste(data_test_train, "/X_", data_test_train, ".txt", sep = ""), as.is = TRUE, col.names = column_names, colClasses = mean_and_std_col_NULL_NA, nrows = lenght_of_rows)

   return (the_data)
}


################2- Adding subject numbers #######################################
#
# Add activity labels into data.frame by:
# 1.  Reading the activity number to label mapping from "activity_labels.txt" file.
# 2.  Reading activity data from the file X_test or X_train.txt .
# 3.  Generating an activity label column using mapping from 1. above to lookup 
#     the activity label.
# 4.  Adding the activity label column to the data set by lining up rows.
#

add_activities <- function(data_set, data_test_train, lenght_of_rows = 10299)
{
   activities <- read.table(file = "activity_labels.txt", as.is = TRUE, col.names = c("activity_number","activity"))

   activity_data <- read.table(file = paste(data_test_train, "/y_", data_test_train, ".txt", sep = ""), as.is = TRUE, col.names = c("activity_number"), nrows = lenght_of_rows)

   add_activity <- function(x) activities[(activities$activity_number == x), 2]
   activity_data$activity <-sapply(activity_data$activity_number, add_activity)

   the_data <- mutate(activity = activity_data$activity, data_set)

   return (the_data)
}
#########################3- Adding activity labels #############################
#
# Add subject data into the data.frame by:
# 1.  Reading subject data from "subject_test" or "subject_train.txt" file.
# 2.  Adding the subject number column to the data set by lining up rows.
#

add_subjects <- function(data_set, datatrain, lenght_of_rows = 10299)
{
   subject_data <- read.table(file = paste(datatrain, "/subject_", datatrain, ".txt", sep = ""), as.is = TRUE, col.names = c("subject_number"), nrows = lenght_of_rows)

   the_data <- mutate(subject_number = subject_data$subject_number, data_set)

   return (the_data)
}
##############4-  Summarize the data set, calculating means for all features ##########################
#
# read test data and then train data and combine with rbind into
# a data.frame named "the_data" and summarize into a data.frame
# named "summary_of_the_data".
#
# Finally, write the summarized data to a file.

 no_of_rows = 10299

# Read and process test data.
df_test <- read_data("test", no_of_rows)
df_test <- add_activities(df_test, "test", no_of_rows)
df_test <- add_subjects(df_test, "test", no_of_rows)

# Read and process train data.
df_train <- read_data("train", no_of_rows)
df_train <- add_activities(df_train, "train", no_of_rows)
df_train <- add_subjects(df_train, "train", no_of_rows)

# Combine test and train data which have exactly the columns
df_data <- rbind(df_test, df_train)

# Grouping by subject_number and activity, get the mean of all the mean and standard deviation features.

summary_of_the_data <- group_by(df_data, subject_number, activity) %>% summarise_each(funs(mean))

################# Write summarized data to a file per assignment instructions ##################.
write.table(summary_of_the_data, "summary_of_the_data.txt", row.names=FALSE)
