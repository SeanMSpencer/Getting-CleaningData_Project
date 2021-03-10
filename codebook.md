Getting and Cleaning Data Codebook
================

## Setup

This project is an effort to satisfy the requirements for the Johns
Hopkins Data Science Specialization course **Getting and Cleaning
Data**. We begin by intializing an R script: **run\_analysis.R**, and
loading the dplyr package. This script will walk through the 5 steps
laid out in the project description.

## Data

The source data can be downloaded
[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and the data description can be found
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
<br>

The data comes from the University of California Irvine’s Machine
Learning Repository and consists of data from test subjects wearing commercial smartphones. 

# Structure

The project uses six data files: x_train.txt, x_test.txt, y_train.txt, y_test.txt, subject_train.txt and subject_test.txt. We also have activity_labels.txt and features.txt which are descriptive files describing the features and labels in the test and train data sets. <br>

1. x_train.txt and x_test.txt each contain 561 columns and 7352 and 2947 rows respectively. The columns consist of 561 different sensor measurements derived from the feature list file
2. y_train.txt and x_test.txt each contain 1 column and the same number of rows as the x_test and x_train files. These files contain the codes describing the movement recorded in the test.
3. features.txt lists all 561 features showcased in the x_train.txt and x_test.txt files.


