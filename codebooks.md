################      ARTICULATIONS   ###########################
#		              SUMMARY OF EACH PARTS							            #
#		             NAME OF FUNCTION CONCERNED							        #
#		              EXPLAINATION OF  VARIABLES							      #
#################################################################
###### 1-Loading mean and standard deviations columns #############
########## function read_data######################################
# This first part consist to read data :  X_test.txt  or X_train.txt  
# To make it possible well proceed like this:
# 1.  Read the file features.txt.
# 2. Choose  only the column names with  "mean" and "std"
# 3. Build the vector that we will use  on the files  X_test or X_train.txt  to get the 
# 4. only the appropriated columns with  "mean" and "std"
  
##########################   EXPLAINATION OF  VARIABLES: #######################
#column_numbers: This variable store all the names of the column features$colume_number 
#column_names : This variable store all the names of the column features$colume_number 
# mean_and_std_col_names: store a dataframe containing only the the features$colume_names having "mean" or "std"
# column_names_T_mean_and_std_or_F: This variable store all the columns names of the dataframe features having the "mean" or "std"
# mean_and_std_col_NULL_NA : With this variable, prepare the selection that wil be use in the dataframe x_test or x_train to 
# return only the appropriated variables ( variables names with "mean" or "std" )

################2- Adding subject numbers #######################
############## function add_activities #######################
# Add activity labels into data.frame by:
# 1.  Reading the activity number to label mapping from "activity_labels.txt" file.
# 2.  Reading activity data from the file X_test or X_train.txt .
# 3.  Generating an activity label column using mapping from 1. above to lookup 
#     the activity label.
# 4.  Adding the activity label column to the data set by lining up rows.

#############################EXPLAINATION OF  VARIABLES##############
# activity_data:  is a data frame of two columns. Its store "Y_test" or "Y_train" 
# add_activity: Store the second column (labels's column) of the data frame activities
#data_test_train : take "test" or "train"
#datatrain: take "test" or "train"
# the_data : Store a new data frame, by adding the activity label column to the data set by lining up rows

#########################3- Adding activity labels #############################
############add_subjects##############################
# Add subject data into the data.frame by:
# 1.  Reading subject data from "subject_test" or "subject_train.txt" file.
# 2.  Adding the subject number column to the data set by lining up rows.
#
##########################   EXPLAINATION OF  VARIABLES: #######################
# subject_data : dataframe  that store the subject_test of the subject_train
# the_data : Dataframe obtained by adding the subject number column to the data

##############4-  Summarize the data set, calculating means for all features ##########################
#
# read test data and then train data and combine with rbind into
# a data.frame named "the_data" and summarize into a data.frame
# named "summary_of_the_data".
#
# Finally, write the summarized data to a file.
##########################################
# summary_of_the_data : is  the data frame result. It group the data by activity and subject and mean  with the average of each variable for each 
