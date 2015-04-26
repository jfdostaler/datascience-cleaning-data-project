# datascience-cleaning-data-project
Course Project for "Getting and Cleaning Data" course from the Data Science specialization on Coursera

## Decription
The data for this project is downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The original data is from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The provided script manipulates several files contained in a .zip file to produce a long-form tidy dataset.

The resulting datasets:
- [Code book](https://github.com/jfdostaler/datascience-cleaning-data-project/blob/master/codebook.md)
- Step 4 output: [Full data](https://github.com/jfdostaler/datascience-cleaning-data-project/blob/master/full_data.txt)
  - Each row is a sample containing data along several variables describing the subject's movement
- Step 5 output: [Summarized data](https://github.com/jfdostaler/datascience-cleaning-data-project/blob/master/summarized_data.txt)
  - Each row is the average of those variables across all samples, grouped by Activity and Subject

## Data cleaning script
To run the script, just download and run
> source('run_analysis.R')

**Note**: I don't have a non-Windows machine to test this on, and I'm not 100% sure that the downloading step will > work on all systems. To do that step manually, just download the dataset to the working directory and rename it to **dataset.zip**.

The script runs the following steps:

0. Set up prerequisites
  1. Install the *data-table* package if it's not already installed, and load it
  2. Install the *dplyr* package if it's not already installed, and load it
  3. If the data (zip archive) is not present in the working directory as *dataset.zip*, download it
  4. Extract data from the zip file

1. Merge the test and training data
  1. Read *test/subject_test.txt* into a data.frame (the Subject variable)
  2. Read *test/y_test.txt* into a data.frame (the numeric Activity variable)
  3. Read *test/X_test.txt* into a data.frame (the sensor data)
  4. Combine the columns into a single data.frame using cbind
  5. Repeat steps *i* to *iv* for the training data
  6. Combine the two datasets using rbind
  7. Read the variable names from the *features.txt* files, and set names on the dataframe
  8. Set *Subject* and *Activity* as keys for the data.table

2. Extract columns with mean and standard deviation measurements
  1. Use **select()** from the *dplyr* package to choose the *-mean* and *-std* columns using a regular expression

3. Set descriptive activity names
  1. Read activity names from *activity_labels.txt*
  2. Use **mutate()** from the *dplyr* package to replace the numeric values of the Activity column with their text description
  
4. Set descriptive variable names
  1. Keep the names from features.txt (see codebook), already applied above
    * The original feature names work well
    * Without being more familiar with the experiment and data, it would be hard to improve on the naming scheme
    * The names already capture a lot of information about the variables:
      * Whether they're time-domain or frequency-domain
      * Which sensor the measurement comes from
      * Axis of movement (when relevant)
      * Other calculations performed on the data (i.e. vector magnitude)
  
5. Create a summarized data set
  1. Use the **summarise_each()** function to calculate the mean for each numeric variable
  2. Write the table to file using write.table
