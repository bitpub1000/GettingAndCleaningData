## ----------------------------------------------------------------------------------------
## Getting and Cleaning Data
## Week 4 Assessment
## B McLeod
## 28/05/2016
## ----------------------------------------------------------------------------------------


## ----------------------------------------------------------------------------------------
## SETUP
## ----------------------------------------------------------------------------------------
## Load needed function libraries
## nil


## Source data
setwd("C:/Users/work/Desktop/DataScience/WorkingDir")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "week4data.zip")


## Extract source data to produce folder "UCI HAR Dataset"
unzip("week4data.zip")


## Read data in
test_x_data <- read.table ("./UCI HAR Dataset/test/X_test.txt")
test_y_data <- read.table ("./UCI HAR Dataset/test/Y_test.txt")
test_subject_data <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train_x_data <- read.table ("./UCI HAR Dataset/train/X_train.txt")
train_y_data <- read.table ("./UCI HAR Dataset/train/Y_train.txt")
train_subject_data <- read.table("./UCI HAR Dataset/train/subject_train.txt")
feature_data <- read.table("./UCI HAR Dataset/features.txt")
activity_data <- read.table("./UCI HAR Dataset/activity_labels.txt")


## Peruse the data
head(test_x_data)
head(test_y_data)
head(test_subject_data)
head(train_x_data)
head(train_y_data)
head(train_subject_data)
head(feature_data)
head(activity_data) 



## ----------------------------------------------------------------------------------------
## MERGE THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET.
## In Machine Learning, Test and Training data sets have matching columns.
##	Consequently, join the data set observations (the rows).
## ----------------------------------------------------------------------------------------
x_data <- rbind(test_x_data, train_x_data)
y_data <- rbind(test_y_data, train_y_data)
subject_data <- rbind(test_subject_data, train_subject_data) 



## ----------------------------------------------------------------------------------------
## EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT.
## ----------------------------------------------------------------------------------------
## Identify the indices in the feature set with a value containing 'mean' or 'std' in V2.
## Identify the observations with either of these values right before an open bracket 
indices <- grep("-mean\\(|-std\\(", feature_data$V2)


## Obtain the data using a row subset
mean_std_data <- x_data[, indices]


## Check the data
head(mean_std_data)


## Assign the headings
names(mean_std_data) <- feature_data[indices, 2]


## Remove the brackets as headings are not functions
names(mean_std_data) <- gsub("\\(|\\)", "", names(mean_std_data))


## Check the data again
head(mean_std_data)



## ----------------------------------------------------------------------------------------
## USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET.
## ----------------------------------------------------------------------------------------
## Check the data - column names are V1 and V2 with V2 in Caps and underscores
head(activity_data)


## Update column 1
y_data$V1 = activity_data[y_data[, 1], 2]
names(y_data) <- "Activity"
 

## Replace the underscores with a space in column 2
activity_data$V2 = gsub("_", " ", as.character(activity_data$V2))


## ----------------------------------------------------------------------------------------
## APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES.
## ----------------------------------------------------------------------------------------
names(x_data) <- feature_data[, 2]
names(y_data) <- c("activity")
names(subject_data) <- c("subject")


## ----------------------------------------------------------------------------------------
## FROM THE DATA SET IN STEP 4, CREATES A SECOND, INDEPENDENT TIDY DATA SET WITH THE 
## 	AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT.
## ----------------------------------------------------------------------------------------
## Column bind
tidy_data <- cbind(subject_data, y_data, mean_std_data)


## Aggregate
tidy_data <- aggregate(. ~subject + activity, tidy_data, mean)


## Sort
tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity), ]


## Producing some tidier data
head(tidy_data)



## ----------------------------------------------------------------------------------------
## Ends
## ----------------------------------------------------------------------------------------