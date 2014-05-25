ProjectGCdata
=============
Hello there, in this file i will explain a little bit about the run_analysis script 
that was asked as our course project for the Course "Getting and Cleaning Data" in Coursera

##DATA##
So the data comes from this [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
And as stated by the source the data is built upon:

	**"Human Activity Recognition database built from the recordings 
	of 30 subjects performing activities of daily living (ADL) while carrying a 
	waist-mounted smartphone with embedded inertial sensors."**
	
The specific data used for this project can be found in a zip file [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) 

##run_analysis.R##
In the Github repo you should be able to see a script named "run_analysis.R"
What this script does can be briefly resumed in 5 steps

**It is worth noting that the script assumes the user has downloaded and extracted the data from the zip file
and that the script and the decompressed data are placed on the same file**

	1. It reads the data from the following files "X_train.txt", "X_test.txt", "subject_train.txt", "subject_test.txt", "y_train.txt", "y_test.txt"
	
	2. It merges the train and tests datasets to create at first three datasets
	
	3. Subsets the data for the mean and Standard Deviation for each measurement obtained by the phone accelerometer
	
	4. Assigns a specific activity name to the activities performed by the subjects on the experiments.
	
		4.1. Formats the names of the variables measured so they all:
		
			..*Do not contain capital letters
			
			..*Do not contain underscores, dots or whitespaces
			
			..*Are descriptive
			
	5. Finally the script produces two files 
	
			..* tidy_data.txt = Where we can find in one table the train a test data for the subjects who participated on the experiment, for their activities, and for the mean and standard deviation (S.D) of some measures of the accelerometer. The variables and data in general on this set should be clear and easy to work with for the analyst
			
			..* MeanTidy_data.txt = a summary of variables means and SD's for each activity and each subject
			