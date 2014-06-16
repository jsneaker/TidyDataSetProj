createTidyDF <- function(){
      ##------------------------------------------------------------------------------------------------
      ##    This funtion creates a tidy data set that includes the averages of each variable 
      ##    and each subject from the Human Activity Recognition Using Smartphones Dataset (Version 1.0)
      ##------------------------------------------------------------------------------------------------
      
      ##Create an empty df that will be used to hold the final tidy df
      TidyDF <- data.frame(Subject=character())
      
      print("Beginning to read all the files.  This may take a few moments.")
      
      ##Read all the files
      mydata = read.table("./UCI HAR Dataset/train/X_train.txt")
      mydata2 = read.table("./UCI HAR Dataset/train/y_train.txt")
      mydata3 = read.table("./UCI HAR Dataset/train/subject_train.txt")
      mydata4 = read.table("./UCI HAR Dataset/test/x_test.txt")
      mydata5 = read.table("./UCI HAR Dataset/test/y_test.txt")
      mydata6 = read.table("./UCI HAR Dataset/test/subject_test.txt")
      myfeatures <- read.table("./UCI HAR Dataset/features.txt") ##Create a df of the features

      print("Done reading all the files.  Beginning to merge train and test files.")
      
      ##Merge Train and Test
      mydata7 <- rbind(mydata,mydata4) ##Combine the training and the test
      myactivitiesCombined <- rbind(mydata2,mydata5)
      mysubjectsCombined <- rbind(mydata3,mydata6)

      print("Done merging.  Beginning name the variables with more descriptive names.")
      
      ##Change the names of the columns
      for (x in 1:nrow(myfeatures)){

            colnames(mydata7)[x] <- as.character(myfeatures[x,2]) 
      
      }

      ##Create a copy that we can manipulate; leave mydata7 in place
      mydata8 <- mydata7

      ##Create a df of the features that will be used later
      existingDF <- data.frame(feature=character())

      ##Need a variable for the starting column count
      myColCount <- ncol(mydata8)

      ##Need to variable to track a count of deleted columns
      deletedCol <- 0

      print("Beginning to get rid of unwanted columns.  Keeping mean() and std()")
      
      ##This goes through and only keeps the 66 columns that represent means or std's.
      for (x in 1:myColCount){
      
            if ((grepl("mean()", colnames(mydata7)[x], ignore.case = FALSE, fixed=TRUE)) | (grepl("std()", colnames(mydata7)[x], ignore.case = FALSE, fixed=TRUE))) {
   
                  ##Do nothing
            
            } else {

                  mydata8[colnames(mydata8)[x-deletedCol]] <- NULL
                  deletedCol <- deletedCol +1
            
            }
           
      }

      ##This records the number of desired columns to be used later
      Columns <- ncol(mydata8)

      print("Getting the activity names.")
      
      ##This gets the activity names 
      for (z in 1:nrow(myactivitiesCombined)){
      
            if (myactivitiesCombined[z,1] == 1) {
            
                  myactivitiesCombined[z,2] <- "WALKING"
            
            } else if (myactivitiesCombined[z,1] == 2) {
            
                  myactivitiesCombined[z,2] <- "WALKING_UPSTAIRS"
      
            } else if (myactivitiesCombined[z,1] == 3) {
            
                  myactivitiesCombined[z,2] <- "WALKING DOWNSTAIRS"
            
            } else if (myactivitiesCombined[z,1] == 4) {
            
                  myactivitiesCombined[z,2] <- "SITTING"
            
            } else if (myactivitiesCombined[z,1] == 5) {
            
                  myactivitiesCombined[z,2] <- "STANDING"
            
            } else if (myactivitiesCombined[z,1] == 6) {
            
                  myactivitiesCombined[z,2] <- "LAYING"
            
            }
      }

      ##Change the variable names for activity id, activity label and subject       
      colnames(myactivitiesCombined) <- c("Activity_ID", "Activity_Label")
      colnames(mysubjectsCombined) <- "Subject"

      ##bind together the needed columns
      mydata9 <- cbind(mysubjectsCombined, mydata8)
      mydata10 <- cbind(myactivitiesCombined, mydata9)

      print("Now creating the final tidy data set.")
      ##Go throgh the aggregated data frame, create a Tidy DF
      ##for (a in 4:(Columns + 3)) {
      
        ##    TidyDF_working <- dcast(mydata10, Subject ~ colnames(mydata10[a]), mean, value.var = colnames(mydata10[a]))
      
          ##  TidyDF <- merge(TidyDF, TidyDF_working,all=TRUE)
      ##}
      
      mydata10$Activity_ID = NULL
      
      TidyDF <- melt(mydata10, id=c("Subject", "Activity_Label"))

      TidyDF <- cast(TidyDF, Subject + Activity_Label ~ variable, mean)

      print("Beginning to write out the file.")
      
      ##write out the table to a text file
      write.table(TidyDF, file="./TidyDF.txt", sep="\t",append=F)
      
      print("Success")
      
}


