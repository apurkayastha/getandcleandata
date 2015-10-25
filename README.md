# getandcleandata
This is the Course Project for the Data Science Course "Get and Clean data"

## 1. tidyData.txt
The tidyData.txt should be read in with the following commands:

>address <- "https://s3.amazonaws.com/coursera-uploads/user-a2c519925e32a2ba6489d80e/975117/asst-3/af6015c07b5311e5bfe43f4a235273a1.txt"
>address <- sub("^https", "http", address)
>data <- read.table(url(address), header = TRUE) 
>View(data)

## 2. run_analysis.R

The run_analysis.R is the R script to produce the required tidy data set, from the given data at 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data above is extracted and the working directory in R is set as the folder "UCI HAR Dataset". The R script should be run from inside this working directory.

### Description of the steps in R script to create tidy data

1. Read in all the 6 files in "train" and "test" folders.
2. The "features.txt" file is loaded and the second column is used as descriotive names for all columns in the datasets.
3. After studying the dimensions of the datasets, it is clear that the contents of the "train" folder should be combined with a simple "column bind" as they have the same number of rows/records. Same holds for the contents of the "test" folder. The resulting test file and train file should be combined with a "row bind" as they both have 563 columns.
4. Activity labels are read in from the "actvity_labels.txt" file, and used to replace the numeric values in the dataset.
5. Only the columns with the words "mean" or "std" in them are extracted. This results in 86 variables, and additional "Activity" column, and "Subject" column make the total number of columns 88.
6. Last step is to use dlpyr package to summarise the data to find mean of each activity and each volunteer. This results in the tidyData.txt of 180 (30 volunteers x 6 activities) rows and 88 columns.

## 3. CodeBook.md

The CodeBook.md is a description of the experiment, the variables in the data, 
