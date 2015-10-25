# getandcleandata
This is the Course Project for the Data Science Course "Get and Clean data"

The tidyData.txt should be read in with the following commands:

address <- "https://s3.amazonaws.com/coursera-uploads/user-a2c519925e32a2ba6489d80e/975117/asst-3/af6015c07b5311e5bfe43f4a235273a1.txt"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE) 
View(data)

The run_analysis.R is the R script to produce the required tidy data set, from the given data at 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data above is extracted and the working directory in R is set as the folder "UCI HAR Dataset". The R script should be run from inside this working directory.

The CodeBook.md is a description of the experiment, the variables in the data, 
