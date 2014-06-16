##run_analysis.R (Version 1.0; June 2014)

This scripts in the run_analysis.R file includes a single funcion that creates a tidy data set that includes the averages of each variable and each subject from the Human Activity Recognition UsingSmartphones Dataset (Version 1.0),  The analysis on the raw data set is all included in the run_analysis.R file. 

*Note: The "UCI HAR Dataset"" directory holding the raw data set must be in the working directory.*

*Note: The "reshape" package must be installed and the library action performed.*

*Note: The "reshape2" package must be installed and the library action performed.* 

Instructions:

1. Confirm that the "UCI HAR Dataset" directory holding the raw data set is in your working directory.

2. Confirm that the "reshape" and "reshape2" packages have been installed and library has been performed on both.

3. Source the file *run_analysis.R*: 

4. From the command line, run the function (no parameters): **createTidyDF()**

      - You will see a series of messages communicating actions
      - The final message is "Success".

5. Examine your working directory where you will find the file **TidyDF.txt**. 


The createTidyDF() function works by going through the following actions: 

- The function creates an empty data frame that will be used to hold the final tidy data frame.
- The function then reads all the files from the raw data set that are needed to meet the requirements of the tidy data set.
- The function then merges the various Train and Test files using rbind functionality.  This step satisfies **Instruction #1** of the assignment instructions.
- The function then creates more user friendly descriptive variable names for the the combined data frame.  The descriptions were obtained from the Features.txt file.  This step satisfies **Instruction #4** of the assignment instructions.
- The function then goes through a series of steps creating working copies of data frames and several variables that are to be used in subsequent steps.
- The function then goes through and only keeps the 66 mean() and std() columns by leveraging the grepl function.  This step satisfies **Instruction #2** of the assignment.  
- The function then gets the activity names, binds them together using cbind with the main data frame and then drops the id column leaving only the user friendly Activity Name  This step satisfies **Instruction #3** of the assignment.
- Using melt and cast, the function creates the final data frame that is a data set with the average of each variable for each activity and each subject.  This step satisfies **Instruction #5** of the assignment.
- The final steps write out the table to a text file to the working directory.  The file is called **TidyDF.txt**.


 