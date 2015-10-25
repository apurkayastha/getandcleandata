# Step 4: Appropriately labels the data set with descriptive variable names. 
X_train <- read.table("train/X_train.txt")
dim(X_train)
y_train <- read.table("train/y_train.txt")
dim(y_train)
sub_train <- read.table("train/subject_train.txt")
dim(sub_train)

X_test <- read.table("test/X_test.txt")
dim(X_test)
y_test <- read.table("test/y_test.txt")
dim(y_test)
sub_test <- read.table("test/subject_test.txt")
dim(sub_test)

features <- read.table("features.txt")
dim(features)
col_names <- features$V2
colnames(X_train) <- col_names
colnames(X_test) <- col_names
colnames(y_train) <- "Activity"
colnames(y_test) <- "Activity"
colnames(sub_train) <- "Subject"
colnames(sub_test) <- "Subject"

# Step 1: Merges the training and the test sets to create one data set.
tot_train <-cbind(X_train,y_train,sub_train)
tot_test <- cbind(X_test,y_test,sub_test)
comb_data <- rbind(tot_train,tot_test)
dim(comb_data)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
subset <- comb_data[,grepl("mean|std",colnames(comb_data),ignore.case=TRUE)]
dim(subset)
subset <- cbind(subset,comb_data$Activity,comb_data$Subject)
names(subset)[names(subset)=="comb_data$Activity"] <- "Activity"
names(subset)[names(subset)=="comb_data$Subject"] <- "Subject"

# Step 3: Uses descriptive activity names to name the activities in the data set
act <- read.table("activity_labels.txt")
act$V2
subset$Activity <- act$V2[subset$Activity]

## Step 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.

#install.packages("dplyr")
library(dplyr)

result <- subset %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
dim(result)

write.table(result, "tidyData.txt", row.name=FALSE)
data <- read.table("tidyData.txt", header = TRUE)

View(data)

address <- "https://s3.amazonaws.com/coursera-uploads/user-a2c519925e32a2ba6489d80e/975117/asst-3/af6015c07b5311e5bfe43f4a235273a1.txt"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
View(data)
