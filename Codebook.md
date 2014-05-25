Codebook for run_analysis script
=============
##DATA##
As explained on the Readme file the data comes from this [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
And as stated by the source the data is built upon a series of experiments:

	**"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
		Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
		wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
		we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz."**
	
The specific data used for this project can be found in a zip file [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) 

## Variables ##
Trough the script we worked with roughly 03 Variable's groups namely:

		..* DataSet = comes from the merge of TrainData and TestData, files that are constructed upon the accelerometer and gyroscope results of the train and test phase's.
		..* DataSubject = comes from the merge of TrainSubject and TestSubject, files that are constructed upon the id's of the subject that generated the train and test data.
		..* DataLabels = comes from the merge of TrainLabels and TestLabels, files that contain the identifier of each activity performed by the experiment subject's.

## Studied Measures ##
Although the raw data contained 561 features obtained from the gyroscope and accelerometer signal's, the script acts upon two sets of this features the mean and standard deviation
To filter the data the script founds the DataSet's row number for the variables names that contain "mean" or "std". 
There are only 66 variables that meet the condition previosly specified. It is worth noting that there are variables that include on their names the word "Mean". The script leaves those out as per the raw data documentation these variables were obtained **"by averaging the signals in a signal window sample"** and we weren't interested in that "window sample".
Once i got the row numbers, i subsetted the DataSet in order to get a 10299*66 table

## Variables and Activities names ##
On the raw data i found some variable and activities names that could be edited in order to enhance its comprehensibility and reproducibility. We based these changes in three principles:
	*The Variables/Activities names must*:	
		
		..*Not contain capital letters
			
		..*Not contain underscores, slashes, parenthesis, dots or whitespaces
			
		..*Be descriptive
In order to apply this changes i used the function gsub and tolower and constructed the files ActN and VarNames. The first one in order to give a proper name for the activities performed by the experiment subject's and the second one in order to establish a specific format for the variables measured name's.

## tidy_data.txt and ShortTidyData.txt ##
Once the script has merged and subsetted the raw data, and it has improved the comprehensibility of the data set, the script prints two ".txt" documents.
The first one "tidy_data.txt" resumes the subject id, the activity performed, and the measured value for each variable. This is a table with dimensions 10299 * 68.
For the second "MeanTidy_data.txt", the script uses functions (melt and dcast) from the reshape2 package. In the txt file you can find a summary of variables means and SD's for each activity and each subject this yields a 180*68 dimensions table
