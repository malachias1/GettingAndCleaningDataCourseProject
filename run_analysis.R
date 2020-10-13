#
# Ensure required libraries are available
#
ensureLibraries <- function() {
  if (!require(data.table)) {
    stop("The data.table package is required, but the package does not exist.")
  }
  
  if (!require(dplyr)) {
    stop("The dplyr package is required, but the package does not exist.")
  }
}
#
# Download file from URL provided in instructions to the file data.zip
# in the current working directory. The function presumes the user is
# running R on a Mac. If you are using a different machine you may have
# to adjust the code to work for your machine and OS.
#
# After the file is downloaded, it is unzipped in the current working
# directory. The parent directory is "UCI HAR Dataset". After the 
# unzip operation completes, the zip file is deleted.
#
downloadAndUnzip <- function() {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip", method="curl")
  unzip("data.zip")
  file.remove("data.zip")
}

#
# Return a relative path to the data directory, 
# i.e., "./UCI HAR Dataset".
#
dataDir <- function() {
  file.path(".", "UCI HAR Dataset")
}

#
# Return a relative path to the test directory, 
# i.e., "./UCI HAR Dataset/test".
#
testDir <- function() {
  file.path(dataDir(), "test")
}

#
# Return a relative path to the train directory, 
# i.e., "./UCI HAR Dataset/train".
#
trainDir <- function() {
  file.path(dataDir(), "train")
}

#
# Return a vector of features names (character) that are lower case and all
# non-alpha characters ("(),-") have been removed.
# The function assumes that the current working directory contains
# the unzipped data with out any file name changes or movement.
#
featureNames <- function() {
  features <- fread(file.path(dataDir(), "features.txt"))
  features <- sapply(features$V2, function(k) { gsub("[(),-]", "", k)})
  names(features) <- NULL
  tolower(features)
}

#
# Return a vector of subject ids (character) for each observation
# The function assumes that the current working directory contains
# the unzipped data with out any file name changes or movement.
#
subjects <- function(sDir) {
  # Base name of data directory will be test or
  # train.  I use that to construct the path to
  # the data.
  suffix <- basename(sDir)
  path <- file.path(sDir, sprintf("subject_%s.txt", suffix))
  # Read the list of subjects for each observation
  subjectList <- fread(path)
  # Rename column 1 to "subjectid"
  names(subjectList) <- c("subjectid")
  # Return the subject list table
  subjectList
}

#
# Return a table of activity ids and activities (character).
# The function assumes that the current working directory contains
# the unzipped data with out any file name changes or movement.
#
activities <- function() {
  path <- file.path(dataDir(), "activity_labels.txt")
  activityTable <- fread(path)
  # Rename columns to "activityid" and "activity"
  names(activityTable) <- c("activityid", "activity")
  # Return the activity table
  activityTable
}

#
# Read and return X for either the test or train data
# as a data table with appropriate variable labels and
# subject ids for observations
#
readX <- function(xDir) {
  # Base name of data directory will be test or
  # train.  I use that to construct the path to
  # the data.
  suffix <- basename(xDir)
  path <- file.path(xDir, sprintf("X_%s.txt", suffix))
  # Read data and return as a data.frame.
  # I use a data.frame so that I can use a mask to
  # select the columns I want, which are *mean and *std.
  x <- data.frame(fread(path))
  # Get feature names nicely coded.
  fnames <- featureNames()
  # Construct a mask of feature names for mean and std metrics.
  meanAndStdFeatureNameMask <- grepl("mean|std", fnames)
  # Construct a vector of mean and std feature names
  meanAndStdFeatureNames <- fnames[meanAndStdFeatureNameMask]
  # Select columns from data frame corresponding to mean and std
  # features
  x <- x[, meanAndStdFeatureNameMask]
  # Convert x back to data.table
  x <- tibble::as_tibble(x)
  # Rename variables using mean and std feature names
  x <- x %>% rename_at(vars(names(x)), ~ meanAndStdFeatureNames)
  # Add subject id as first column.
  x <- bind_cols(subjects(xDir), x) 
  # Return the table
  x
}

#
# Read and return y for either the test or train data
# as a data table with appropriate variable labels and
# subject ids for observations
#
readY <- function(yDir) {
  # Base name of data directory will be test or
  # train.  I use that to construct the path to
  # the data.
  suffix <- basename(yDir)
  path <- file.path(yDir, sprintf("y_%s.txt", suffix))
  # Read the label id for each observation data.
  y <- fread(path)
  # Rename V1 column to "activity".
  y <- rename(y, activity=V1)
  # Get map of activity ids to activities
  activityIdMap <- activities()
  # Map activity ids to activities
  y$activity <- sapply(y$activity, function(v) {unlist(activityIdMap[v,2]) })
  # Return the table of label for each observation
  # Add subject id as first column.
  y <- bind_cols(subjects(yDir), y) 
  y
}

# Return a table for X test data with subject id,
#  mean metrics, and std metrics
testX <- function() {
  # Return a table of X for test observations with
  # subject ids, mean metrics, and std metrics
  readX(testDir())
}

# Return a table for X train data with subject id,
#  mean metrics, and std metrics
trainX <- function() {
  # Return a table of X for train observations with
  # subject ids, mean metrics, and std metrics
  readX(trainDir())
}

# Return a table for y test data with subject id and
# labels
testY <- function() {
  # Return a table of labels for test observations with
  # subject ids and label
  readY(testDir())
}

# Return a table for y train data with subject id and
# labels
trainY <- function() {
  # Return a table of labels for train observations with
  # subject ids and label
  readY(trainDir())
}

#
# Get and Clean UCI HAR Dataset. Data will be
# written to the current working directory.
# The raw data will be found in the directory "UCI HAR Dataset".
# X (input) and y (activity labels) will be in Xy.csv.
# The mean of all metrics by activity and subject will be found in
# activitySummary.csv.
#
# All necessary libraries will be loaded, if the packages
# have been installed.  If the necessary packages do not
# exist, the script will stop and print a message indicating
# which package was missing.
#
getCleanUciHarDataset <- function() {
  # Ensure that necessary libraries have been loaded.
  ensureLibraries()
  # Download raw data.
  downloadAndUnzip()
  # Load X test input data into table.
  testXData <- testX()
  # Load X train input data into table.
  trainXData <- trainX()
  # Load y test activity labels into table.
  testyData <- testY()
  # Load y train activity labels into table.
  trainyData <- trainY()
  # Combine test and train inputs
  XData <- rbind(testXData, trainXData)
  # Combine test and train activity labels
  yData <- rbind(testyData, trainyData)
  # Combine inputs and activity labels. Relocate activity
  # after subject id.
  XyData <- mutate(XData, activity=yData$activity) %>%
    relocate(activity, .after=subjectid)
  # Generate a csv file for Xy data
  write.csv(XyData, "Xy.csv", row.names = FALSE)

  # Construct an activity summary
  activitySummary <- XyData %>% 
    group_by(activity, subjectid) %>% 
    summarise_all(mean)
  # Generate a csv file for activity summary.
  write.csv(activitySummary, "activitySummary.csv", row.names = FALSE)
}