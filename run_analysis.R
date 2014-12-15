########################################################################################
##
##  To perform analysis for this assignment, it is necessary to download dataset from URL:
##  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
##  The code below checks if the Samsung data exists in the working directory in its original form.
##  The code looks for the necessary data in the directory ”./UCI HAR Dataset/" 
##  structured as in the linked archive. If this folder is not in your working directory, 
##  the script will be downloaded from the web and unzipped to your working directory.
##
##  If you want to prevent downloading, make sure that you retrieve and copy a folder named
##  ”UCI HAR Dataset/" to the working directory.
##
########################################################################################

run_analysis <- function() {
    ## Load 'dplyr' package needed for analysis. If it isn't installed, 
    ## install the 'dplyr' package with install.packages()
    library(dplyr)
    
    ## Check if the data folder exists in the working directory. If not, retrieve it from the web 
    if (!file.exists("UCI HAR Dataset")) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, "data.zip", method = "curl") 
        unzip("data.zip")
    }
    
    ## Read in the names of the feature variabes and activities
    features <- read.table("./UCI HAR Dataset/features.txt", col.names=c("number", "name"), colClasses="character") 
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("ID", "name")) 
    
    ## Read in all the necessary files from test dataset
    test_subjectID <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subjectID") 
    test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=make.unique(features$name), check.names=FALSE)
    test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="activity")
    
    ## Gather all infromation from test dataset in one data frame
    test <- data.frame(test_subjectID, test_labels, test_set, check.names=FALSE)
    
    ## Read in all the necessary files from train dataset
    train_subjectID <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subjectID") 
    train_set <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=make.unique(features$name), check.names=FALSE)
    train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="activity")
    
    ## Gather all infromation from train dataset in one data frame
    train <- data.frame(train_subjectID, train_labels, train_set, check.names=FALSE)
    
    ## Merge test and train sets into one dataset
    data <- rbind(test, train)
    
    ## Transform 'activity' variable as factor and replace numeric values with the corresponding activity names  
    data$activity <- factor(data$activity, labels = activity_labels$name)
    
    ## Use 'dplyr' package and its chaining properties to make desired tidy dataset
    tidy_data <-                                                                ## set the name for the new dataset to be stored in
        tbl_df(data) %>%                                                        ## wrap original data frame for 'dplyr'
        select(subjectID, activity, contains("mean()"), contains("std()")) %>%  ## extract desired columns from the dataset
        group_by(subjectID, activity) %>%                                       ## group selected data by 'subjectID' and 'activity'
        summarise_each(funs(mean))                                              ## for each group calculate mean values of 
                                                                                ## all non-grouping variables
    
    # write tidy dataset to a file 
    write.table(tidy_data, "tidy_data.txt", row.names=FALSE)
    
}

