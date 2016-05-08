

# CleaningData
That are some instructions to run the file I have submited

1- Make sure you have install and load the dplyr. If not, run the following commands
	install.packages("dplyr")
	library(dplyr)
	
2 - Set your location to reach the file "getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset". 
	So use the setwd(). 
	for instance setwd("E:\\TRAVAUX_COURS\\Cleaning_Data\\devoir\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset)
	
3- run the command
  source(file="your_file_location/run_analysis.R", echo=TRUE)  
  your_file_location  is the file where you have download run_analysis.R
  
4- You can the file summary_of_the_data.txt, in the directory you set at the step 2 

############# THE FOLOWING LINES SHOW IS HOW THE CODE PEERFORM ###################

############# 1-Loading mean and standard deviations columns ######################
#
# This first part consist to read data :  X_test.txt  or X_train.txt  
# To make it possible well proceed like this:
# 1.  Read the file features.txt.
# 2. Choose  only the column names with  "mean" and "std"
# 3. Build the vector that we will use  on the files  X_test or X_train.txt  to get the 
# 4. only the appropriated columns with  "mean" and "std"
  

################2- Adding subject numbers #######################################
#
# Add activity labels into data.frame by:
# 1.  Reading the activity number to label mapping from "activity_labels.txt" file.
# 2.  Reading activity data from the file X_test or X_train.txt .
# 3.  Generating an activity label column using mapping from 1. above to lookup 
#     the activity label.
# 4.  Adding the activity label column to the data set by lining up rows.

#########################3- Adding activity labels #############################
#
# Add subject data into the data.frame by:
# 1.  Reading subject data from "subject_test" or "subject_train.txt" file.
# 2.  Adding the subject number column to the data set by lining up rows.
#

##############4-  Summarize the data set, calculating means for all features ##########################
#
# read test data and then train data and combine with rbind into
# a data.frame named "the_data" and summarize into a data.frame
# named "summary_of_the_data".
#
# Finally, write the summarized data to a file.

################# Write summarized data to a file per assignment instructions ##################.
