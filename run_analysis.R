#setwd (../UCI HAR Dataset) must set wd to signal your data location
#1
#So at first we read the data into tables and then #
# using rbind we merge training data with its test data par#
TrainData <- read.table ("./train/X_train.txt") 
TestData <- read.table ("./test/X_test.txt")
  DataSet <- rbind (TrainData,TestData)

TrainSubject <- read.table ("./train/subject_train.txt") 
TestSubject <- read.table ("./test/subject_test.txt")
  DataSubject <- rbind (TrainSubject,TestSubject)

TrainLabels <- read.table ("./train/y_train.txt") 
TestLabels <- read.table ("./test/y_test.txt")
  DataLabels <- rbind (TrainLabels,TestLabels)

#2
#Extracts only the measurements on the mean and standard 
#deviation for each measurement. 
Features <- read.table("./features.txt")
# Extract Row numbers for mean and SD
MeanRows <- grep("mean\\(\\)", Features[, 2])
SdRows <- grep("std\\(\\)", Features[, 2])
# Joins and sort those two new vector with the mean and sd Rows
MeanSdRows <- c(MeanRows,SdRows)
RowsSorted <- sort (MeanSdRows, decreasing = FALSE)
# Subsets the data for only the measuraments on mean and SD
DataSet<- DataSet[,RowsSorted]

#3 
#Uses descriptive activity names to name 
#the activities in the data set
ActN <- read.table("./activity_labels.txt")
ActN <- tolower (ActN[,2]) 
ActN <- gsub("_","",ActN)
DataLabels[,1] <- ActN [DataLabels[,1]] 

#4 
#Appropriately labels the data set with descriptive activity names 
#I know from the lectures that variable names should:
#not contain capital letters
#not contain underscores, dots, whitespaces, or the like
#be descriptive
names(DataLabels) <- "activities"
names(DataSubject) <- "subject"
VarNames <- Features[RowsSorted,2]
VarNames <- tolower(VarNames)
VarNames <- gsub("-|\\(\\)","",VarNames)
names (DataSet) <- VarNames
#Now im gonna construct a Data Set with (in order) Subject, Activity, and Reading
TidyData <- cbind (DataSubject, DataLabels, DataSet)
write.table(TidyData,"tidy_data.txt")
#5
# Creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject
# install.packages("reshape2")
library("reshape2")
LongTidyData <- melt(TidyData, id.vars =c ("subject","activities")) 
ShortTidyData <- dcast (LongTidyData, subject+activities ~ variable,mean)
write.table(ShortTidyData,"MeanTidy_data.txt")                      

