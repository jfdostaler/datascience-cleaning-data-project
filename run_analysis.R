## run_analysis.R
## author: JF Dostaler
##
## Coursera - Getting and Cleaning Data - Course Project
## Creates a tidy dataset from the "Human Activity Recognition Using Smartphones" Data Set
## Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Constants
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
DESTFILE <- "dataset.zip"

# We'll want to easily navigate the zip file by changing the working directory
# Save the original working directory so we can revert to it at the end of the script
origwd <- getwd()

# Install and load required packages if necessary
loadPackage <- function (pkg) {
  if (! pkg %in% installed.packages()) {
    message("Installing package: " , pkg)
    install.packages( toString(pkg) )
  }
  require( pkg, character.only = TRUE )
}
loadPackage('data.table')
loadPackage('dplyr')


# Download the dataset (if it's not already in the working directory)
if (!DESTFILE %in% dir()) {
  message("Downloading data from: " , URL)
  download.file(url = URL, destfile = "dataset.zip", method = "auto", mode = "wb")
} else {
  message("The dataset archive is already present in the working directory.")
}


# Extract the data from the .zip file
message("Extracting data from archive.")
unzip(DESTFILE)
setwd("UCI HAR Dataset")

# Step 1: Merge the test and training data

# Load in the data
message('Reading test data.')
testdata <- cbind(
  read.table('test/subject_test.txt'),
  read.table('test/y_test.txt'),
  read.table('test/X_test.txt')
)

message('Reading training data.')
traindata <- cbind(
  read.table('train/subject_train.txt'),
  read.table('train/y_train.txt'),
  read.table('train/X_train.txt')
)

message('Combining data sets.')
dt <- data.table(rbind(testdata, traindata))

# set column names from features.txt
message('Setting column names')
colnames <- fread('features.txt')$V2
setnames(dt, c("Subject", "Activity", colnames))
setkey(dt, Subject, Activity)

activitynames <- fread('activity_labels.txt')$V2

#2. Extract only columns that contain the mean and standard deviation
tidyData <- dt %>%
  select(Subject, Activity, matches("-(std|mean)\\(\\)")) %>%
  mutate(Activity = activitynames[Activity]) %>%
  group_by(Subject, Activity)

#4. Give descriptive column names
# This is already done above. We're using the column names from features.txt

#5. Aggregate by activity/subject
message('Calculating means')
summaryData <- tidyData %>% summarise_each(funs(mean))

# Clean up
setwd(origwd)
write.table(tidyData, file = "full_data.txt", row.names = FALSE)
write.table(summaryData, file = "summarized_data.txt", row.names = FALSE)

message('Done!')
message('Step #4 Tidy data is in variable "tidyData"')
message('Step #5 Summarized data is in variable "summaryData"')