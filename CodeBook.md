#Description of the Variables and the Data

##Subject

Potential values: 1-30.  This variables hold the value indicating which of the 30 volunteers within an age bracket of 19-48 years. 

##Activity_Label

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  This vairable holds one or the six possible avtivities.  

##66 measurement variables that are the mean and standard deviation subset of all measurements.*
The full set of features from the raw data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

The 66 columns in this tidy data set are the mean and standard deviation subset of all measurements.  The data within each variable are the average of each variable for each activity and each subject.

#Description of Transformations
The function works by going through the following actions: 

- The function creates an empty data frame that will be used to hold the final tidy data frame.
- The function then reads all the files from the raw data set that are needed to meet the requirements of the tidy data set.
- The function then merges the various Train and Test files using rbind functionality.  This step satisfies **Instruction #1** of the assignment instructions.
- The function then creates more user friendly descriptive variable names for the the combined data frame.  The descriptions were obtained from the Features.txt file.  This step satisfies **Instruction #4** of the assignment instructions.
- The function then goes through a series of steps creating working copies of data frames and several variables that are to be used in subsequent steps.
- The function then goes through and only keeps the 66 mean() and std() columns by leveraging the grepl function.  This step satisfies **Instruction #2** of the assignment.  
- The function then gets the activity names, binds them together using cbind with the main data frame and then drops the id column leaving only the user friendly Activity Name  This step satisfies **Instruction #3** of the assignment.
- Using melt and cast, the function creates the final data frame that is a data set with the average of each variable for each activity and each subject.  This step satisfies **Instruction #5** of the assignment.
- The final steps write out the table to a text file to the working directory.  The file is called **TidyDF.txt**.