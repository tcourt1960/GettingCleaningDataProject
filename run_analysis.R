## Project Assignment for "Getting and Cleaning Data" Coursera 

# All read.table commands assume the associated data files are in the working directory
# The test data is located in a folder test, and the training data is located in a folder called train.
# The test and train folder are located in the Working directory.

# Read in training and test data
train_data <- read.table("train/X_train.txt", stringsAsFactors=FALSE, header=FALSE)
test_data<- read.table("test/X_test.txt", stringsAsFactors=FALSE, header=FALSE)

#ABOVE WORKS. GOOD to GO

# Read in training and test activity codes
train_codes <- read.table("train/y_train.txt", stringsAsFactors=FALSE, header=FALSE)
test_codes <- read.table("test/y_test.txt", stringsAsFactors=FALSE, header=FALSE)

#ABOVE WORKS.  GOOD to GO

#Read in Activity Labels
activity_labels<-read.table("activity_labels.txt", stringsAsFactors=FALSE, header =FALSE)

# Great. Above Works

#Read in features
features<- read.table("features.txt", stringsAsFactors=TRUE, header=FALSE)

#Great! Above works!

#REad in Subjects files for both test and training
subject_test<-read.table("test/subject_test.txt",stringsAsFactors=FALSE, header =FALSE)
subject_train<-read.table("train/subject_train.txt",stringsAsFactors=FALSE, header =FALSE)

#Great. Above works

#Modify Features headings (V1, V2...) with their Feature names for test and training datatables
names(test_data)<-features$V2
names(train_data)<-features$V2

#Great that works.  Test and traing data now has headings

# Next, Bind Subject to features and put into test_data_all and train_data_all. Rename column Subject
test_data_all<-cbind(subject_test,test_data,sort=FALSE)
names(test_data_all)[1] <- "Subject"

train_data_all<-cbind(subject_train,train_data, sort=FALSE)
names(train_data_all)[1] <- "Subject"

#Great that works.

#Next, add activity names next to each activity code. Relabel columns


# Create a new column with descriptive words for Activities
for (x in 1:length(test_codes$V1)) {
    test_codes$Activity[x]<-activity_labels$V2[test_codes$V1[x]]
}

for (x in 1:length(train_codes$V1)) {
    train_codes$Activity[x]<-activity_labels$V2[train_codes$V1[x]]
}



names(test_codes)<-c("Activity Code", "Activity")
names(train_codes)<-c("Activity Code", "Activity")

#Great. That works


#Now, bind Activty codes and Activity names to complete test and training tables with all info
test_data_all<-cbind(test_codes,test_data_all,sort=FALSE)
train_data_all<-cbind(train_codes,train_data_all,sort=FALSE)

#Finally, row bind the training and test complete dataframe
combined_data<-rbind(test_data_all, train_data_all)

#Awesome. combined_data all the data now in one big dat frame!

#select columns that include mean or standard deviation data
# Selected any column which has the string "mean" or "std" anywhere in the column name.
select_mean_stdev<-c(1:6, 121:126)
#must increment column ids by 3 because I added three columns for Activity Code, Activity and Subject variables
select_mean_stdev<-select_mean_stdev+3
#put back in columns 1:3 
select_mean_stdev<-c(1:3,select_mean_stdev)

#Selected_data now includes only columns with "mean" or "std" in column variable name.
selected_data<-combined_data[,select_mean_stdev]

#Great!  


#Get rid of Activity COde, it's no longer needed.
selected_data<-selected_data[,-1]

#Relable variables with descriptive names.
newnames<-c("xbodyacceleration_mean", "ybodyacceleration_mean", "zbodyacceleration_mean", 
            "xbodyacceleration_standarddeviation", "ybodyacceleration_standarddeviation", "zbodyacceleration_standarddeviation", 
            "xbodygyro_mean", "ybodygyro_mean", "zbodygyro_mean", 
            "xbodygyro_standarddeviation", "ybodygyro_standarddeviation", "zbodygyro_standarddeviation" 
            )

names(selected_data)<-c("Activity", "Subject",newnames)


#Time to extract means by activity and subject
library(reshape2)
melted<-melt(selected_data,id=c("Activity","Subject"))
tidyset<-dcast(melted, Subject + Activity ~ variable, fun.aggregate=mean)

write.csv(tidyset,file="tidyset.txt",row.names=TRUE)
