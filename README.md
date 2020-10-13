# Getting and Cleaning Data Course Project
## Overview
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.
## Instructions
To retrieve and build the dataset source run_analysis.R and then run the
getCleanUciHarDataset() function. The script requires the data.table and
dplyr libraries. These libraries are loaded by the script if necessary.
If either library is unavailable, the script will stop and print a message
telling you which library is missing.

After running the script, you will have a tidy dataset in Xy.csv, consisting of 
subject id, activity label, and multiple input metrics for the mean and
standard deviation of 3-axial raw signals for accelerometers and gyroscopes
as well as multiple derived metrics.  See CodeBook.md for details.

You will also find a file activitySummary.csv.  The data file provides the
mean of all metrics by activity.

Lastly, the raw data will be found in the "UCI HAR Dataset"" directory.
