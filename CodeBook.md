#Descriptions of Variables


#Descriptions of the Data

#Descriptions of Transformations
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